#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import hashlib
import glob
import base64
import zipfile
import shutil
import datetime
import subprocess
from auto_delete import autoDelete

SRC="/home/logyou/logging/logdata"
BACKUP_FOLDER = "/home/logyou/logging/logdata_backup_and_zip"

class backupAndZip(object):
    def __init__(self):
        self.basepath = SRC
        self.destzip = os.path.join(BACKUP_FOLDER, "zip_log")
        self.destbackup = os.path.join(BACKUP_FOLDER,"backup_log")
        self.datefile_pattern = str(datetime.datetime.now().strftime('%Y-%m-%d-%H'))+".log"


    def getCheckSum(self, logfile:str=""):
        # BUF_SIZE is totally arbitrary, change for your app!
        BUF_SIZE = 65536  # lets read stuff in 64kb chunks!

        md5 = hashlib.md5()
        sha1 = hashlib.sha1()
        sha256 = hashlib.sha256()

        with open(logfile, 'rb') as f:
            while True:
                data = f.read(BUF_SIZE)
                if not data:
                    break
                md5.update(data)
                sha1.update(data)
                sha256.update(data)

        print("MD5: {0}".format(md5.hexdigest()))
        print("SHA1: {0}".format(sha1.hexdigest()))
        print("SHA256: {0}".format(sha256.hexdigest()))
        return md5.hexdigest(), sha1.hexdigest(), sha256.hexdigest()

    def backup(self, filepath, logfile):
        print("Backup")
        filepath_split = filepath.split("/")
        destdir = os.path.join(self.destbackup, filepath_split[0], filepath_split[1], filepath_split[2])
        print("destdir",destdir)
        if not os.path.exists(destdir):
            os.makedirs(destdir)

        dest = shutil.move(logfile, destdir)
        print("Destination path raw file backup:", dest)
        dest = shutil.move(logfile+".hash", destdir)
        print("Destination path hash file backup:", dest)
        pass

    def zip(self, filepath, filehashnumber, logfile):
        print("Zip")
        filepath_split = filepath.split("/")
        destdir = os.path.join(self.destzip, filepath_split[0], filepath_split[1], filepath_split[2])
        zippass = base64.b64encode(str.encode(os.path.join(filepath_split[0],filepath_split[2],filepath_split[3])))
        #print("zippass",zippass)
        # zippass2 = base64.b64decode(zippass)
        # print("zippass2",zippass2)
        print("destdir",destdir)
        if not os.path.exists(destdir):
            os.makedirs(destdir)
        zipname = os.path.join(destdir,filepath_split[3]+"-"+ filehashnumber +".zip")
        dest = shutil.copyfile(logfile+".hash", zipname+".hash")
        print("Destination path hash file backup on zip:", dest)
        runzipcommand = subprocess.call(['zip', '-j', '-P', zippass, zipname, logfile, logfile+".hash"])
        print(runzipcommand)

    def start(self):
        print("Start Backup and Zip")
        for device in os.listdir(self.basepath):
            list_of_files = glob.glob(os.path.join(self.basepath,device,'**/**/*.log'))
            for logfile in list_of_files:
                print("self.datefile_pattern",self.datefile_pattern)
                if logfile.find(self.datefile_pattern) != -1:
                    print("skip", logfile)
                    continue
                # Write New Hash File
                print("logfile",logfile)
                md5, sha1, sha256 = self.getCheckSum(logfile)
                f = open(logfile+".hash", "w")
                f.write("MD5: {0}\n".format(md5))
                f.write("SHA1: {0}\n".format(sha1))
                f.write("SHA256: {0}\n".format(sha256))
                f.close()
                
                logfile_path_split = logfile.split(self.basepath+"/")
                print(logfile_path_split)
                
                self.zip(logfile_path_split[1], sha1, logfile)
                self.backup(logfile_path_split[1],logfile)
                
            print(list_of_files)
            
        # Delete Empty Folder
        autoDelete().removeEmptyFolders(path=self.basepath,removeRoot=False)
    
if __name__ == '__main__':
    backupAndZip().start()