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

class CheckCollectorStatus(object):
    def __init__(self):
        self.ramstatus = os.popen("free -b | head -2 |tail -1").read()
        self.cpustatus = os.popen("top -b -d1 -n1 | grep Cpu | cut -d':' -f 2").read()
        self.diskstatus = 0
        self.status_data = {"memory": "",
                            "cpu": "",
                            "filesystem": ""}
        self.disklist = ["/"]

    def check(self):
        print("Check Collector Status")
        # print("---RAM---")
        # print("total",self.ramstatus.split()[1])
        # print("use",self.ramstatus.split()[2])
        # print("free",self.ramstatus.split()[3])
        self.status_data["memory"] = {"total": int(self.ramstatus.split()[1]),
                                      "used": int(self.ramstatus.split()[2]),
                                      "free": int(self.ramstatus.split()[3])
                                      }

        # print("-"*9)

        # print("---CPU---")
        cpu_status_split = self.cpustatus.split(',')
        # print("cpu_user", cpu_status_split[0].strip().split()[0])
        # print("cpu_system", cpu_status_split[1].strip().split()[0])
        # print("cpu_idle", cpu_status_split[3].strip().split()[0])
        # print("cpu_iowait", cpu_status_split[4].strip().split()[0])
        # print("cpu_st", cpu_status_split[7].strip().split()[0])
        self.status_data["cpu"] = {"user": float(cpu_status_split[0].strip().split()[0]),
                                   "system": float(cpu_status_split[1].strip().split()[0]),
                                   "idle": float(cpu_status_split[3].strip().split()[0]),
                                   "iowait": float(cpu_status_split[4].strip().split()[0]),
                                   "st": float(cpu_status_split[7].strip().split()[0])
                                   }

        # print("-"*9)

        # print("---HDD---")
        disklistdetail = []
        for i in self.disklist:
            diskdetail = os.popen("df " + i + " | tail -1").read().split()
            # print(diskdetail)
            # print("filesystem", diskdetail[0])
            # print("size", diskdetail[1])
            # print("used", diskdetail[2])
            # print("avail", diskdetail[3])
            # print("usepercent", diskdetail[4][:-1])
            # print("mounted", diskdetail[5])
            disklistdetail.append({"name": diskdetail[0],
                                   "size": int(diskdetail[1]),
                                   "used": int(diskdetail[2]),
                                   "avail": int(diskdetail[3]),
                                   "use_persen": diskdetail[4][:-1],
                                   "mounted_on": diskdetail[5]
                                   })
        self.status_data["filesystem"] = disklistdetail
        # print("-"*9)
        # print(self.status_data)

    def send_server(self, protocal:str="https", urlserver:str="localhost", webkey:str=None, authen:str=None, issslverify:bool=True):
        self.server = "%s://%s/logyou/api/collector/status/%s" %(protocal, urlserver, webkey)
        print(self.server, self.status_data)
        headers = {'collector' : '1234567890' , 'Content-Type' : 'application/json'}        
        resp = requests.post(url = self.server, data=json.dumps(self.status_data), auth=authen, headers=headers, verify=issslverify)
        print ("resp", resp, resp.text)


    def start(self):
        print("start")
        # print(self.check_date, self.check_path)
        self.check()
        #self.send_status()
        # self.send_server(urlserver="logyou.uih.co.th" , webkey = os.environ.get('WEB_KEY') , authen=('log','log@123') )
        self.send_server(protocal="http", urlserver="localhost:8001" , webkey = os.environ.get('WEB_KEY_LOCAL') , authen=('log','PC4bxy1dio') )
        # self.send_server(urlserver="223.27.235.41" , webkey = os.environ.get('WEB_KEY') , authen=('log','PC4bxy1dio'), issslverify=False )

if __name__ == '__main__':
    CheckCollectorStatus().start()

