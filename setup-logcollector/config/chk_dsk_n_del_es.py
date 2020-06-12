#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-
from auto_delete import autoDelete
import argparse
import os
import requests
import json

class checkDiskSpaceAndDeleteSearch(object):
    def __init__(self):
        self.diskpath = "/"
        self.server = "http://localhost:9200"

    def getDiskUsedPercent(self):
        print("Get Disk Used")
        diskdetail = os.popen("df " + self.diskpath + " | tail -1").read().split()
        return int(diskdetail[4][:-1])

    def getSearchIndex(self):
        print("get Index")
        index_date_list = []
        try:
            index_date_list = autoDelete().removeSearchData(isChkDisk=True)
        except:
            print("Cannot get Indext date list")
        # print(index_date_list)
        return index_date_list
        
    def lockSearch(self):
        url_req = self.server + "/_all/_settings"
        data = { "index.blocks.read_only_allow_delete": "true"}
        headers = {'Content-Type' : 'application/json'}
        resp = requests.put(url=url_req, data=json.dumps(data), headers=headers)
        print("lockSearch",resp.text)
    
    def unlockSearch(self):
        url_req = self.server + "/_all/_settings"
        data = { "index.blocks.read_only_allow_delete": "false"}
        headers = {'Content-Type' : 'application/json'}
        resp = requests.put(url=url_req, data=json.dumps(data), headers=headers)
        print("unlockSearch",resp.text)
    
    def deleteSearchIndex(self, indexpattern:str=""):
        url_req = self.server + "/com*%s" %(indexpattern)
        resp = requests.delete(url=url_req)
        print("delete_date",indexpattern,resp.text)

    def start(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--disk-search-limit','-s', action='store', dest='disk_search_limit', default=80, type=int,
                                help='Disk percentage that can store searching')
        parser.add_argument('--disk-lock-limit','-l', action='store', dest='disk_lock_limit', default=90, type=int,
                                help='Disk percentage that lock for add data to search')
        parser.add_argument('--version', action='version', version='%(prog)s 1.0')
        results_arg = parser.parse_args()
        
        self.disk_search_limit = results_arg.disk_search_limit
        self.disk_lock_limit = results_arg.disk_lock_limit
        search_index = self.getSearchIndex()
        for i in search_index:
            diskusage = self.getDiskUsedPercent()
            print(diskusage)
            if diskusage > self.disk_lock_limit:
                self.lockSearch()
                break
            if diskusage > self.disk_search_limit:
                self.unlockSearch()
                self.deleteSearchIndex(i)
            else:
                break
    
if __name__ == '__main__':
    checkDiskSpaceAndDeleteSearch().start()