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

SRC_DIR="/home/logyou/logging/logdata"

class CheckSourceStatus(object):
    def __init__(self,BasePath=SRC_DIR):
        self.status_data = []
        self.basepath = BasePath

    def check(self):
        print("Check Source Status")
        for device in os.listdir(self.basepath):
            list_of_files = glob.glob(os.path.join(self.basepath,device,'**/**/*.log'))
            latest_file = max(list_of_files, key=os.path.getctime)
            print (device, os.path.getctime(latest_file))
            self.status_data.append({"ip": device, "timestamp": int(os.path.getctime(latest_file))})

    def send_server(self, protocal:str="https", urlserver:str="localhost", webkey:str=None, authen:str=None, issslverify:bool=True):
        self.server = "%s://%s/logyou/api/source/status/%s" %(protocal, urlserver, webkey)
        print(self.server)
        headers = {'collector' : '1234567890' , 'Content-Type' : 'application/json'}        
        resp = requests.post(url = self.server, data=json.dumps(self.status_data), auth=authen, headers=headers, verify=issslverify)
        print ("resp", resp.text)

    def start(self):
        print("start")
        # print(self.check_date, self.check_path)
        self.check()
        #self.send_status()
        # self.send_server(urlserver="logyou.uih.co.th" , webkey = os.environ.get('WEB_KEY') , authen=('log','log@123') )
        self.send_server(protocal="http", urlserver="localhost:8001" , webkey = os.environ.get('WEB_KEY_LOCAL') , authen=('log','PC4bxy1dio') )
        # self.send_server(urlserver="223.27.235.41" , webkey = os.environ.get('WEB_KEY') , authen=('log','PC4bxy1dio'), issslverify=False )

if __name__ == '__main__':
    CheckSourceStatus(SRC_DIR).start()

