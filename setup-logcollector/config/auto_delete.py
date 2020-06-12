#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import os
import argparse
import time
import glob
import requests
import datetime
import json

class autoDelete(object):
    def __init__(self):
        self.backuppath = "/home/logyou/logging/logdata_backup_and_zip/backup_log"
        self.zippath = "/home/logyou/log/logfile"
        self.now = time.time()
        self.current_date = datetime.date.today()
        self.server = "http://localhost:9200"
    
    def removeEmptyFolders(self, path, removeRoot=True):
        'Function to remove empty folders'
        if not os.path.isdir(path):
            return

        # remove empty subfolders
        files = os.listdir(path)
        if len(files):
            for f in files:
                fullpath = os.path.join(path, f)
                if os.path.isdir(fullpath):
                    self.removeEmptyFolders(fullpath)

        # if folder empty, delete it
        files = os.listdir(path)
        if len(files) == 0 and removeRoot:
            print ("Removing empty folder:", path)
            os.rmdir(path)
    
    def removeOldFile(self, pathfile, datedelete):
        try:
            for device in os.listdir(pathfile):
                list_of_files = glob.glob(os.path.join(pathfile,device,'**/**/**'))
                for logfile in list_of_files:
                    if os.stat(logfile).st_mtime < self.now - datedelete * 86400:
                        print("deleting...", logfile)
                        os.remove(logfile)
        except:
            print("Cannot Delete")

    def removeBackupFile(self):
        self.removeOldFile(self.backuppath, self.backup_collect_date)
        self.removeEmptyFolders(self.backuppath, removeRoot=False)
    
    def removeZipFile(self):
        self.removeOldFile(self.zippath, self.zip_collect_date)
        self.removeEmptyFolders(self.zippath, removeRoot=False)
    
    def removeSearchData(self, isChkDisk:bool=False):
        print("removeSearchData")
        url_req = self.server + "%s" %("/_cat/indices/com*?format=json")
        resp = requests.get(url = url_req)
        #print(resp.text)
        index_list = json.loads(resp.text)
        date_list = []
        for i in index_list:
            date_list.append(i["index"][-10:])
            #print(i)
        date_list = list(dict.fromkeys(date_list))
        # using this for get date list
        if isChkDisk:
            # Sort Date To delete
            return sorted(date_list)
        # Delete Search Index that older than THD
        else:
            delete_date = self.current_date - datetime.timedelta(days=self.search_collect_date)
            for date in date_list:
                if datetime.datetime.strptime(date, "%Y-%m-%d").date() < delete_date:
                    url_req = self.server + "/com*%s" %(date)
                    resp = requests.delete(url = url_req)
                    print("delete_date",date,resp.text)
            return
    
    def start(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--backup','-b', action='store', dest='backup_collect_date', default=5, type=int,
                                help='Number of day(s) that store backup RAW log file')
        parser.add_argument('--zip','-z', action='store', dest='zip_collect_date', default=92, type=int,
                                help='Number of day(s) that store backup ZIP log file')
        parser.add_argument('--search','-s', action='store', dest='search_collect_date', default=35, type=int,
                                help='Number of day(s) that store SEARCHING log')
        parser.add_argument('--version', action='version', version='%(prog)s 1.0')
        results_arg = parser.parse_args()

        self.backup_collect_date = results_arg.backup_collect_date
        self.zip_collect_date = results_arg.zip_collect_date
        self.search_collect_date = results_arg.search_collect_date

        self.removeBackupFile()
        self.removeZipFile()
        self.removeSearchData()

if __name__ == '__main__':
    autoDelete().start()