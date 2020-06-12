#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import paramiko
import os
import shutil
import datetime

class dbFTPOverSSH(object):
    def __init__(self):
        #self.host = "filelogyou.uih.co.th"
        self.host = "localhost"
        self.port = 22
        self.user = "logyou"
        self.keypath = "/home/logyou/.ssh/id_rsa"
        
        #self.localDBBackup = "/home/bucket/%s/database_backup" %(self.user)
        self.localDBBackup = "/home/%s/database_backup" %(self.user)
        
        self.backupDBCloudDestDir = os.path.join("/home", self.user, "database_backup")
        self.dbBackupFileName = "logcollector_"+self.user+"_"+str(datetime.datetime.now().strftime('%Y-%m-%d_%H-%M'))+".gz"
    
    def copyDBLocal(self):
        print("copyLogLocal")
        #print(filepath, logfile)
        dest = shutil.copy(self.dbBackupFileName, self.localDBBackup)
        print("Destination path:", dest)
    
    def copyDBToBackupCloud(self, trans):
        print("copyLogToBackupCloud")
        print("sftp_dir",self.backupDBCloudDestDir)
        trans.chdir(self.backupDBCloudDestDir)
        # print(logfile, os.path.join(sftp_dir,filename))
        trans.put(self.dbBackupFileName, os.path.join(self.backupDBCloudDestDir, self.dbBackupFileName))

    def start(self):
        print("Start Backup and Zip")
        
        try:
            # Open SFTP Connection
            key = paramiko.RSAKey.from_private_key_file(self.keypath)
            trans = paramiko.Transport((self.host, self.port))
            trans.connect(username=self.user, pkey=key)
            sftp = paramiko.SFTPClient.from_transport(trans)
            
            # Create Database Backup File
            command = "mysqldump -u logyou -pmKsnoRnmMY56 --skip-extended-insert logcollector | gzip -c > %s" %(self.dbBackupFileName)
            os.popen(command)
            
            # Coppy and/or SFTP Database Backup
            self.copyDBLocal()
            #self.copyDBToBackupCloud(sftp)
            
            # Close SFTP Connection
            sftp.close()
            trans.close()
        except Exception as e:
            print("Error", e)

if __name__ == '__main__':
    dbFTPOverSSH().start()