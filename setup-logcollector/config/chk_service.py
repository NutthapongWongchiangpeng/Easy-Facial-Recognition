#!/home/logyou/project/django/bin/python
# -*- coding: utf-8 -*-

import os
# from datetime import datetime, timedelta
import glob
# import time
import json
import requests
import socket
import urllib.parse
import urllib3
urllib3.disable_warnings()


class CheckServiceStatus(object):
    def __init__(self):
        self.status_data = []
        self.es_service_stat = None
        self.ls_service_stat = None
        self.es_jvm_percent = None
        self.es_port_stat = None
        self.ls_port_stat = None
        self.ls_conf_file = glob.glob("/etc/logstash/conf.d/*.conf")
        self.line_access_token="MzoMcX5vPAh1yWhMYxy7M5CjwoHudaarLfIxNFaV4wu"
        self.url = "https://notify-api.line.me/api/notify"

    def checkElasticsearchServiceStatus(self):
        print("Check Elasticsearch Status")
        self.es_service_stat = os.system("systemctl is-active --quiet elasticsearch")
        print("es service", self.es_service_stat) # If return 0, service run normally
        if self.es_service_stat != 0:
            print("ES Service Down")
            self.status_data.append({"service_alert": "Elasticsearch Service Down"})
        else:
            self.es_port_stat = (os.popen("netstat -plnt | grep 9200 | wc -l")).read
            print("es port", self.es_port_stat)
            if self.es_port_stat == 0:
                self.status_data.append({"service_alert": "Elasticsearch Port 9200 Down"})
                
    def checkLogstashServiceStatus(self):
        print("Check Logstash Status")
        self.ls_service_stat = os.system("systemctl is-active --quiet logstash")
        print("ls service", self.ls_service_stat) # If return 0, service run normally
        if self.ls_service_stat != 0:
            print("LS Service Down")
            self.status_data.append({"service_alert": "Logstash Service Down"})
        else:
            self.ls_port_stat = (os.popen("netstat -plnt | grep 9600 | wc -l")).read
            print("LS port", self.ls_port_stat)
            if self.ls_port_stat == 0:
                self.status_data.append({"service_alert": "Logstash Port 9600 Down"})
    
    def checkElasticsearchJVMStaus(self):
        print("Check ES JVM")
        # self.es_jvm = json.dumps(os.popen("curl -XGET http://localhost:9200/_cluster/stats").read())
        # print(self.es_jvm["nodes"]["jvm"]["mem"])
        self.es_jvm_percent = os.popen("curl localhost:9200/_cat/nodes?h=hp").read()
        try:
            if int(self.es_jvm_percent) >= 95:
                print("ES JVM Heap Over THD, Now ES Heap is ", int(self.es_jvm_percent))
                self.status_data.append({"service_alert": "Heap Used more than 95 percent"})
            else:
                print("Nothing to do ", int(self.es_jvm_percent), "%")
        except:
            self.es_error = json.loads(self.es_jvm_percent)
            print("error", self.es_error["error"]["root_cause"][0]["type"])
            self.status_data.append({"service_alert": self.es_error["error"]["root_cause"][0]["type"]})
            
    def disableESPipeline(self):
        print("disableESPipeline")
        for f in self.ls_conf_file:
            command = "sed -i 's/.*pipeline.*send_to.*ls2es.*/#pipeline_es/g' %s" %(f)
            os.popen(command)
        
    
    def enableESPipeline(self):
        print("enableESPipeline")
        for f in self.ls_conf_file:
            command = "sed -i 's/^#pipeline_es.*/pipeline { send_to => [ls2es] }/g' %s" %(f)
            os.popen(command)

    def send_server(self, protocal:str="https", urlserver:str="localhost", webkey:str=None, authen:str=None, issslverify:bool=True):
        self.server = "%s://%s/logyou/api/ea/%s" %(protocal, urlserver, webkey)
        print(self.server)
        headers = {'collector' : '1234567890' , 'Content-Type' : 'application/json'}
        resp = requests.post(url = self.server, data=json.dumps(self.status_data), auth=authen, headers=headers, verify=issslverify)
        print ("resp", resp.text)

    def sendLineMessage(self, message:str):
        if message:
            # print ("token : %s" %(self.line_access_token))
            msg = urllib.parse.urlencode({"message": message})
            LINE_HEADERS = {'Content-Type': 'application/x-www-form-urlencoded',
                            "Authorization": "Bearer " + self.line_access_token}
            session = requests.Session()
            a = session.post(self.url, headers=LINE_HEADERS, data=msg)
            print("Line Resp",a.text)

    def start(self):
        print("start")
        # print(self.check_date, self.check_path)
        self.checkElasticsearchServiceStatus()
        self.checkLogstashServiceStatus()
        try:
            self.checkElasticsearchJVMStaus()
        except:
            print("port not start")
        print(self.status_data)
        #self.send_status()
        if self.status_data != []:
            # self.send_server(urlserver="logyou.uih.co.th" , webkey = os.environ.get('WEB_KEY') , authen=('log','log@123') )
            self.send_server(protocal="http", urlserver="localhost:8001" , webkey = os.environ.get('WEB_KEY_LOCAL') , authen=('log','PC4bxy1dio') )
            # self.send_server(urlserver="223.27.235.41" , webkey = os.environ.get('WEB_KEY') , authen=('log','PC4bxy1dio'), issslverify=False )
            self.sendLineMessage("Service Error, From %s, Message %s" %(socket.gethostname(), self.status_data))
            self.disableESPipeline()
        else:
            self.enableESPipeline()

if __name__ == '__main__':
    CheckServiceStatus().start()

