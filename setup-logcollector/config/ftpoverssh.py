#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import paramiko
import os
import glob
import shutil
import subprocess
from auto_delete import autoDelete

class ftpOverSSH(object):
    def __init__(self):
        #self.host = "filelogyou.uih.co.th"
        self.host = "localhost"
        self.port = 22
        self.user = "logyou"
        self.keypath = "/home/logyou/.ssh/id_rsa"
        
        self.basepath = "/home/logyou/logging/logdata_backup_and_zip/zip_log"
        #self.localdestdir = "/home/bucket/%s/log/logfile" %(self.user)
        self.localdestdir = "/home/logyou/log/logfile"
        
        self.backupLogCloudDestDir = os.path.join("/home/bucket", self.user, "log/logfile")
    
    def checkAndCreateDir(self, filepath, basedir:str=None, isCreateDir:bool=True):
        print("checkAndCreateDir")
        if basedir == None:
            basedir = self.localdestdir
        try:
            filepath_split = filepath.split("/")
            destdir = os.path.join(basedir, filepath_split[0], filepath_split[1], filepath_split[2])
            print("destdir",destdir)
            if not os.path.exists(destdir) and isCreateDir:
                os.makedirs(destdir)
            return destdir, filepath_split[3]
        except:
            print("Cannot Create Folder")
            return None
        
    def mkdir_p(self, trans, remote_directory):
        print("mkdir_p")
        """Change to this directory, recursively making new folders if needed.
        Returns True if any folders were created."""
        if remote_directory == '/':
            # absolute path so change directory to root
            trans.chdir('/')
            return
        if remote_directory == '':
            # top-level relative directory must exist
            return
        try:
            trans.chdir(remote_directory) # sub-directory exists
        except IOError:
            dirname, basename = os.path.split(remote_directory.rstrip('/'))
            # print(dirname, basename)
            self.mkdir_p(trans, dirname) # make parent directories
            trans.mkdir(basename) # sub-directory missing, so created it
            trans.chdir(basename)
            return True
    
    def copyLogLocal(self, filepath, logfile, logfilehash):
        print("copyLogLocal")
        #print(filepath, logfile)
        try:
            #destdir, _ = self.checkAndCreateDir(filepath)
            #dest = shutil.copy(logfile, destdir)
            print(filepath)
            dest = subprocess.call(['cp', '-rf', logfile, os.path.join(self.localdestdir,filepath)])
            print("File copied", dest)
        except:
            print("Can not copy file")
        #print("Destination path:", dest)
    
    def copyLogToBackupCloud(self, filepath, logfile, logfilehash, trans):
        print("copyLogToBackupCloud")
        sftp_dir, filename = self.checkAndCreateDir(filepath=filepath, basedir=self.backupLogCloudDestDir, isCreateDir=False)
        print("sftp_dir",sftp_dir)
        self.mkdir_p(trans, sftp_dir)
        trans.chdir(sftp_dir)
        # print(logfile, os.path.join(sftp_dir,filename))
        trans.put(logfile, os.path.join(sftp_dir,filename))
        trans.put(logfilehash, os.path.join(sftp_dir,filename+".hash"))

    def start(self):
        print("Start Backup and Zip")
        
        try:
            # Open SFTP Connection
            key = paramiko.RSAKey.from_private_key_file(self.keypath)
            trans = paramiko.Transport((self.host, self.port))
            trans.connect(username=self.user, pkey=key)
            sftp = paramiko.SFTPClient.from_transport(trans)

            # Copy and/or SFTP File
            list_of_files = glob.glob(os.path.join(self.basepath,'**/**/**/*.zip'))
            for logfile in list_of_files:
                try:
                    print(logfile)
                    logfile_path_split = logfile.split(self.basepath+"/")
                    self.copyLogLocal(logfile_path_split[1], logfile, logfile+".hash")
                    #with self.copyLogToBackupCloud(logfile_path_split[1], logfile, logfile+".hash", sftp):
                    os.remove(logfile)
                except:
                    continue

            # Delete empty Dir
            autoDelete().removeEmptyFolders(path=self.basepath,removeRoot=False)
            # Close SFTP Connection
            sftp.close()
            trans.close()
        except Exception as e:
            print("Error", e)

if __name__ == '__main__':
    ftpOverSSH().start()