#!/bin/bash
sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-oracle/jre/bin/java

#enable logstash on start
sudo systemctl enable logstash
#enable kibana on start
#sudo systemctl enable kibana
#enable elasticsearch on start
sudo systemctl enable elasticsearch

sudo systemctl restart elasticsearch
sudo systemctl restart logstash
sudo systemctl restart nginx
sudo systemctl restart mariadb
sudo systemctl restart logyou

sudo ufw disable
sudo ufw enable