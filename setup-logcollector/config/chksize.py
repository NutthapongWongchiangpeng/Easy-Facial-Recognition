#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import os
from datetime import datetime, timedelta
import glob
import time
import json
import requests

import urllib3
urllib3.disable_warnings()

SRC_DIR="/home/logyou/logging/logdata_backup_and_zip"

class CheckSize(object):
    def __init__(self,BasePath=SRC_DIR):
        CheckDate = []
        CheckPathBackup = os.path.join(BasePath,'backup_log')
        if not os.path.isdir(CheckPathBackup):
            print("Checking Directory dose not exist!!")
            exit()

        if datetime.strftime(datetime.now(), '%H') == "00":
            CheckDate.append(datetime.strftime(datetime.now() - timedelta(1), '%Y-%m-%d'))

        CheckDate.append(datetime.strftime(datetime.now(), '%Y-%m-%d'))

        self.check_path = CheckPathBackup
        self.base_path = BasePath
        self.check_date = CheckDate
        self.status_data = []
        self.current_time = int(time.time())


    def check(self):
        print("Check Size")
        #print(list(self.check_path.glob('**/**/**/*.log')))
        for log_source_name in os.listdir(self.check_path):
            for log_date in self.check_date:
                print("log_date", log_date)
                total_size = 0
                log_file_glob = glob.glob(os.path.join(self.check_path, log_source_name, "**", log_date, "*.log"))
                if log_file_glob:
                    num_file = len(log_file_glob)
                    for logfile in log_file_glob:
                        total_size += os.path.getsize(logfile)
                    #print(os.path.join(self.check_path,log_source_name,log_source_type,log_date),num_file,total_size)
                    self.status_data.append({"timestamp":self.current_time,
                                            "ip":log_source_name,
                                            "date":log_date,
                                            "numfile":num_file,
                                            "size":total_size})
        print(self.status_data)

    def send_server(self, protocal:str="https", urlserver:str="localhost", webkey:str=None, authen:str=None, issslverify:bool=True):
        self.server = "%s://%s/logyou/api/source/log/%s" %(protocal, urlserver, webkey)
        print(self.server)
        headers = {'collector' : '1234567890' , 'Content-Type' : 'application/json'}        
        resp = requests.post(url = self.server, data=json.dumps(self.status_data), auth=authen, headers=headers, verify=issslverify)
        print (resp)

    def start(self):
        print("start")
        print(self.check_date, self.check_path)
        self.check()
        #self.send_status()
        # self.send_server(urlserver="logyou.uih.co.th" , webkey = os.environ.get('WEB_KEY') , authen=('log','log@123') )
        self.send_server(protocal="http", urlserver="localhost:8001" , webkey = os.environ.get('WEB_KEY_LOCAL') , authen=('log','PC4bxy1dio') )
        # self.send_server(urlserver="223.27.235.41" , webkey = os.environ.get('WEB_KEY') , authen=('log','PC4bxy1dio'), issslverify=False )

if __name__ == '__main__':
    CheckSize(SRC_DIR).start()

