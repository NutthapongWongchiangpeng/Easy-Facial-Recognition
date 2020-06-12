#!/bin/bash

#uih staff
OWN_USER="uih"
OWN_GROUP="uih"

#runner account
RUNNER_USER="logyou"
RUNNER_GROUP="logstash"
########################## S T A R T  C H A N G E ##########################
KEY=`cat web_key`
WEB_HOST="http:\/\/localhost:8001"
#WEB_HOST="https:\/\/logyou.uih.co.th"
WEB_USER="log"
WEB_PASSWORD="PC4bxy1dio"

SFTP_HOST="localhost"
#SFTP_HOST="filelogyou.uih.co.th"
SFTP_USER=$RUNNER_USER
#SFTP_USER="poc"

SFTP_KEY="key"

ELASTIC_HOST="http:\/\/localhost:9200"
ELASTIC_USER=""
ELASTIC_PASSWORD=""
#COMPANY_NUMBER => get from database
COMPANY_NUMBER="1"

#customer staff
# CUS_USER="cust"
# CUS_GROUP="customer"

#PATH_PROJECT_AND_DJANGO
PATH_PROJECT="/home/$RUNNER_USER/project"

#PATH_INSTALL_WEB_APP
PATH_EGG="logyou_app"

#PATH PID (Service)
#PATH_PID="/var/run/logyou/"

LS_PIPELINE_BS="500"
LS_PIPELINE_BD="6"

LS_HEAP="2"
ES_HEAP="2"
########################### E N D  C H A N G E ###########################

CRONTAB_FILE="crontab_logyou"
CRONTAB_ROOT="crontab_root"

#logstash folder output
LOGSTASH_FOLDER_OUTPUT="/home/$RUNNER_USER/logging/logdata"
BACKUP_FOLDER="/home/$RUNNER_USER/logging/logdata_backup_and_zip"

#elastic pack version
ELASTIC_VERSION="7.x"
PACKAGE_ELASTIC="https://artifacts.elastic.co/packages/$ELASTIC_VERSION/apt"

###############################################################################
###                             start step								    ###
###############################################################################


#step 1 set time from server
function syncTimeServer(){
    #setup timezone
    sudo timedatectl set-timezone Asia/Bangkok
    echo "setup timezone Asia/Bangkok"
    date
    #enable time sync NTP
    sudo timedatectl set-ntp on
    ntp_server="time.navy.mi.th time2.nimt.or.th time3.nimt.or.th th.pool.ntp.org 1.th.pool.ntp.org ntp.ubuntu.com"
    sudo cp /etc/systemd/timesyncd.conf timesyncd.conf
    sudo sed -i "s/#NTP=/NTP=$ntp_server/g" timesyncd.conf
    sudo cp timesyncd.conf /etc/systemd/timesyncd.conf
    sudo rm timesyncd.conf
    echo "setup ntp :$ntp_server"
    
    sudo systemctl restart systemd-timesyncd.service
    sudo systemctl status systemd-timesyncd.service
}

#step 1 install java8 is support logstash 6.x
function installJava8(){
    
    #sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    #sudo apt install oracle-java8-installer -y
    #sudo apt install openjdk-8-jdk -y
    sudo apt install openjdk-11-jdk -y
    #sudo update-alternatives --config java
    #sudo update-alternatives --config javac
    
    #set JAVA_HOME
    
    if [ -z "$JAVA_HOME" ]
    then
        #java_path=`readlink -f $(which javac)`
        #java_path=${java_path:0:-5}
        #echo "find java path $java_path"
        
        sudo cp /etc/environment environment.old
        sudo cp /etc/environment .
        
        #For ELK 6.x
        #sudo sed -i "/\PATH/a JAVA_HOME=\"$java_path\"" environment

        #For ELK 7.x
        #sudo sed -i "/\PATH/a JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\"" environment
        sudo sed -i "/\PATH/a JAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64\"" environment
        sudo sed -i "/\JAVA_HOME/a JDK_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64\"" environment
        sudo sed -i "/\JDK_HOME/a WEB_KEY=\"$KEY\"" environment
        sudo sed -i "/\WEB_KEY/a WEB_KEY_LOCAL=\"$KEY\"" environment
        sudo cp environment /etc/environment

        #For ELK 6.x
        #export JAVA_HOME="$java_path"
        #For ELK 7.x
        #export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
        export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

        #sudo setcap cap_net_bind_service=+epi "$java_path/java"
        # sudo echo "$java_path/java" >> /etc/ld.so.conf.d/logyou.conf
        # sudo ldconfig
        
        ########## START Hard Setting ###############
        #sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-oracle/jre/bin/java
        
        #sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-openjdk-amd64/bin/java
        #sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
        sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-11-openjdk-amd64/bin/java
        sudo echo "setcap cap_net_bind_service=+epi /usr/lib/jvm/java-11-openjdk-amd64/bin/java" >> /etc/rc.local
        ########## END Hard Setting ###############
        #source /etc/environment
        echo $JAVA_HOME
        echo "set up JAVA_HOME already"
    else
        echo "JAVA_HOME is not empty"
    fi
}

#step 2 install logstash
function installELK(){
    ## Check if directory <install_pack> exits?
    ## if not -> Add and Download from repo
    ## if directory <install_pack> exits -> install from file
    if [[ ! -d install_pack ]]
	then
		# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
        # echo "deb $PACKAGE_ELASTIC stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-$ELASTIC_VERSION.list
        # sudo apt update
        # sudo apt install -y elasticsearch logstash kibana 
        mkdir install_pack
        cd install_pack
        wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.2.0-amd64.deb
        wget https://artifacts.elastic.co/downloads/kibana/kibana-7.2.0-amd64.deb
        wget https://artifacts.elastic.co/downloads/logstash/logstash-7.2.0.deb
        cd ..
    fi
    sudo dpkg -i install_pack/*.deb
    ## In case of using beat and do it manually.

    #auditbeat filebeat packetbeat metricbeat apm-server
    #sudo nano /etc/auditbeat/auditbeat.yml
    #sudo nano /etc/filebeat/filebeat.yml
    #sudo nano /etc/packetbeat/packetbeat.yml
    #sudo cp /etc/filebeat/modules.d/netflow.yml.disabled /etc/filebeat/modules.d/netflow.yml
    #sudo cp /etc/filebeat/modules.d/system.yml.disabled /etc/filebeat/modules.d/system.yml
    #sudo systemctl enable auditbeat filebeat packetbeat
    #sudo systemctl restart auditbeat filebeat packetbeat
    
    #step 3 change owner run
    sudo cp /etc/systemd/system/logstash.service logstash.service.old
    sudo cp /etc/systemd/system/logstash.service logstash.service
    sudo sed -i "s/User=logstash/User=$RUNNER_USER/g" logstash.service
    sudo sed -i "s/Group=logstash/Group=$RUNNER_GROUP/g" logstash.service
    sudo cp logstash.service /etc/systemd/system/logstash.service
    echo "change owner run logstash.service already"
    
    #step 4 insert config
    sudo cp /etc/logstash/logstash.yml logstash.yml.old
    sudo cp /etc/logstash/logstash.yml logstash.yml
    
    sudo echo "http.host: \"0.0.0.0\"" >> logstash.yml
    sudo echo "pipeline.batch.size: $LS_PIPELINE_BS" >> logstash.yml
    sudo echo "pipeline.batch.delay: $LS_PIPELINE_BD" >> logstash.yml
    
    sudo echo "config.reload.automatic: true" >> logstash.yml
    sudo echo "config.reload.interval: 3s" >> logstash.yml
    sudo cp logstash.yml /etc/logstash/logstash.yml
    
    #install plugin output
    #sudo /usr/share/logstash/bin/logstash-plugin install logstash-output-syslog
}

#step 5 create user
function createUser(){
    # echo "##########################"
    # echo "## Create Customer User ##"
    # echo "##########################"
    # sudo adduser $CUS_USER
    
    echo "########################"
    echo "## Create logyou user ##"
    echo "########################"
    sudo adduser $RUNNER_USER
    #set primary group
    sudo usermod -g $RUNNER_GROUP $RUNNER_USER
    #append new group list
    sudo usermod -aG $RUNNER_USER $RUNNER_USER
    VIEWER_PATH=`eval echo ~$RUNNER_USER`
}

#step 6 create folder
function createFolder(){
    echo "create floder"
    #LOGSTASH_FOLDER_OUTPUT="/logstash"
    #BACKUP_FOLDER="/logstash_backup_and_zip"
    sudo mkdir -p $LOGSTASH_FOLDER_OUTPUT
    sudo mkdir -p $BACKUP_FOLDER
    sudo mkdir -p $BACKUP_FOLDER/backup_log
    sudo mkdir -p $BACKUP_FOLDER/zip_log
    sudo mkdir -p $BACKUP_FOLDER/database_backup
    
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $LOGSTASH_FOLDER_OUTPUT
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $BACKUP_FOLDER
    
    sudo mkdir -p /home/$RUNNER_USER/log/logfile
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP /home/$RUNNER_USER/log

    sudo chmod 700 `eval echo ~$OWN_USER`
    
    ls -al $LOGSTASH_FOLDER_OUTPUT
    ls -al $BACKUP_FOLDER
}

#step 10 start ELK
function startELKService(){
    #enable ELK on start
    sudo systemctl enable logstash kibana elasticsearch
    #reload deamon
    sudo systemctl daemon-reload
    #start ELK
    sudo systemctl restart logstash kibana elasticsearch
    #start ELK on boot up
    # sudo update-rc.d elasticsearch defaults 95 10
    # sudo update-rc.d logstash defaults 96 9
    # sudo update-rc.d kibana defaults 97 9
}

#set 7 copy files config
function copyConfig(){
    ## Copy file to tmp dir -> replace config -> copy&chown to work dir
    cp -Rf config config_used
    # sed -i "s/\[WEB_HOST\]/$WEB_HOST/" config_used/curlsender.sh
    # sed -i "s/\[WEB_USER\]/$WEB_USER/" config_used/curlsender.sh
    # sed -i "s/\[WEB_PASSWORD\]/$WEB_PASSWORD/" config_used/curlsender.sh
    
    # sed -i "s/\[SFTP_HOST\]/$SFTP_HOST/" config_used/sftp.sh
    # sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/sftp.sh
    
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chklastmod.sh
    # sed -i 's|\[LOGSTASH_FOLDER_OUTPUT\]|'$LOGSTASH_FOLDER_OUTPUT'|g' config_used/chklastmod.sh
    
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chkusage.sh
    
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chksize.sh
    
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/auto_delete.sh
    # sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/g" config_used/auto_delete.sh
    # sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/g" config_used/auto_delete.sh
    # sed -i "s/\[ELASTIC_USER\]/$ELASTIC_USER/g" config_used/auto_delete.sh
    # sed -i "s/\[ELASTIC_PASSWORD\]/$ELASTIC_PASSWORD/g" config_used/auto_delete.sh
    
    # sed -i 's|\[LOGSTASH_FOLDER_OUTPUT\]|'$LOGSTASH_FOLDER_OUTPUT'|g' config_used/start.sh
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/start.sh
    
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/ftp_start.sh

    sed -i "s/\[WEB_HOST\]/$WEB_HOST/" config_used/cal_usage_history.sh
    sed -i "s/\[WEB_USER\]/$WEB_USER/" config_used/cal_usage_history.sh
    sed -i "s/\[WEB_PASSWORD\]/$WEB_PASSWORD/" config_used/cal_usage_history.sh

    # sed -i "s/\[SFTP_HOST\]/$SFTP_HOST/" config_used/db_sftp.sh
    # sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/db_sftp.sh

    # sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/db_backup.sh
    # sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/db_backup.sh

    # sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/g" config_used/chk_dsk_n_del_es.sh
    # sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/g" config_used/chk_dsk_n_del_es.sh
    # sed -i "s/\[ELASTIC_USER\]/$ELASTIC_USER/g" config_used/chk_dsk_n_del_es.sh
    # sed -i "s/\[ELASTIC_PASSWORD\]/$ELASTIC_PASSWORD/g" config_used/chk_dsk_n_del_es.sh

    sed -i "s/\[WEB_HOST\]/$WEB_HOST/" config_used/chk_web.sh
    
    sudo chmod 755 config_used/*
    sudo cp -Rf config_used/* $BACKUP_FOLDER
    
    cp -Rf log_chksum log_chksum_used
    sed -i 's|\[VIEWER_PATH\]|'$VIEWER_PATH'\/|g' log_chksum_used/chksum.sh
    sudo cp -Rf log_chksum_used/* $BACKUP_FOLDER

    sudo cp web_key $BACKUP_FOLDER/web_key
    export WEB_KEY=$KEY
    
    rm -Rf config_used
    rm -Rf log_chksum_used
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $BACKUP_FOLDER
}


#step 8 set private key for sftp
function setPrivateKey(){
    sudo mkdir -p $VIEWER_PATH/.ssh
    sudo cp -rf $SFTP_KEY/* $VIEWER_PATH/.ssh/
    
    sudo chmod 700 -R $VIEWER_PATH/.ssh
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $VIEWER_PATH/.ssh
    #sudo sftp $SFTP_USER@$SFTP_HOST
    
    echo "set privatekey already"
}

#step 9 setup crontab
function setupCrontab(){
    sudo apt install dos2unix -y
    dos2unix crontab*

    sudo crontab -u $RUNNER_USER -r
    cp -rf $CRONTAB_FILE $CRONTAB_FILE.old
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' $CRONTAB_FILE
    sudo crontab -u $RUNNER_USER $CRONTAB_FILE
    sudo crontab -u $RUNNER_USER -l
    echo "setup logyou contrab already"

    sudo crontab -r
    cp -rf $CRONTAB_ROOT $CRONTAB_ROOT.old
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' $CRONTAB_ROOT
    sudo crontab $CRONTAB_ROOT
    sudo crontab -l
    echo "setup root contrab already"
}

#step 10 config logstash
function setupConfigLogstash(){
    sudo mkdir config_logstash_used
    sudo cp config_logstash/* config_logstash_used
    #collec normal elastic
    sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/g" config_logstash_used/es-syslog.conf
    sed -i "s/\[ELASTIC_USER\]/$ELASTIC_USER/g" config_logstash_used/es-syslog.conf
    sed -i "s/\[ELASTIC_PASSWORD\]/$ELASTIC_PASSWORD/g" config_logstash_used/es-syslog.conf
    sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/g" config_logstash_used/es-syslog.conf
    #collec normal fs
    sed -i "s|\[LOGSTASH_FOLDER_OUTPUT\]|$LOGSTASH_FOLDER_OUTPUT|g" config_logstash_used/fs-syslog.conf
    OUTPUT=""
    sed -i "s|\[OUTPUT\]|$OUTPUT|g" config_logstash_used/fs-syslog.conf

    #sending message to web api
    sed -i "s/\[WEB_HOST\]/$WEB_HOST/g" config_logstash_used/http-syslog.conf
    sed -i "s/\[WEB_USER\]/$WEB_USER/g" config_logstash_used/http-syslog.conf
    sed -i "s/\[WEB_PASSWORD\]/$WEB_PASSWORD/g" config_logstash_used/http-syslog.conf

    sudo cp -Rf /etc/logstash/pipelines.yml pipelines.yml.old
    sudo cp -Rf config_logstash_used/*.conf /etc/logstash/conf.d/
    sudo cp -Rf config_logstash_used/*.yml /etc/logstash/

    sudo mkdir -p /etc/logstash/ls_conf
    sudo cp -Rf config_logstash/ls_conf/* /etc/logstash/ls_conf/
    sudo mkdir -p /etc/logstash/patterns
    sudo cp -Rf config_logstash/patterns/* /etc/logstash/patterns/
    
    sudo rm -Rf config_logstash_used

    sudo chown -R $RUNNER_USER:$RUNNER_GROUP /var/log/logstash/
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP /var/lib/logstash/
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP /etc/logstash/
}

function installNginx(){
    sudo apt update
    #remove nginx
    sudo apt-get -y remove --purge nginx nginx-common
    sudo apt-get autoremove -y
    sudo apt-get autoclean

    #install nginx
    sudo apt install -y nginx
    genSSL
    
    sudo nginx -t
    sudo systemctl restart nginx
    
    sudo systemctl status nginx
    
}

function genSSL(){
    echo "Gen SSL Certificate"
    touch /home/uih/.rnd
    sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=TH/ST=Bangkok/L=Chatuchak/O=United Information Highway Co., Ltd./OU=SOC Division - Security Services Department/CN=logyou.uih.co.th/emailAddress=soc@uih.co.th"
    sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
    
    sudo rm -Rf /etc/nginx/snippets/self-signed.conf
    sudo rm -Rf /etc/nginx/snippets/ssl-params.conf
    
    sudo mkdir /etc/nginx/snippets/
    sudo cp -Rf nginx/snippets/*  /etc/nginx/snippets/
    sudo cp -Rf /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old
    sudo cp -Rf nginx/default /etc/nginx/sites-available/default
    
}

#port config
function allowport(){
    sudo ufw allow 'Nginx FULL'
    sudo ufw allow 'OpenSSH'
    sudo ufw allow 514
    sudo ufw allow 5040/tcp
    #sudo ufw allow 5044/tcp
    sudo ufw allow 9300/tcp
    #sudo ufw allow 2055/udp
    #sudo ufw delete allow from 192.168.0.89 to any port 514
    sudo ufw enable
    sudo ufw status numbered
}

#setup python
function setup_python(){
    #prerequest
    orig=$(pwd)
    sudo apt-get install -y build-essential checkinstall
    sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g  libnss3-dev  libffi-dev
    sudo apt-get install -y default-libmysqlclient-dev
    sudo rm /usr/src/Python-3.7.2.tgz
    sudo wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz -P /usr/src
    sudo tar -xvf /usr/src/Python-3.7.2.tgz -C /usr/src/
    cd /usr/src/Python-3.7.2/
    sudo ./configure --enable-optimizations
    sudo make altinstall
    
    cd $orig
}

#setup python env
function setup_env(){
    sudo rm -Rf $PATH_PROJECT
    sudo mkdir $PATH_PROJECT
    
    sudo python3.7 -m venv $PATH_PROJECT/django
    sudo $PATH_PROJECT/django/bin/python -m pip install --upgrade pip
	sudo $PATH_PROJECT/django/bin/pip install uwsgi
    sudo $PATH_PROJECT/django/bin/pip install Django===2.2.6
    echo "install env already : $PATH_PROJECT/django"
}

#setup install egg
function install_egg(){

    CURRENT_PATH=`pwd`
    sudo $PATH_PROJECT/django/bin/easy_install -Z $PATH_EGG/*.egg
    sudo rm -Rf $PATH_PROJECT/logyou
    sudo mkdir -p $PATH_PROJECT/logyou/app/logs
    sudo cp -Rf $PATH_EGG/* $PATH_PROJECT/logyou
    sudo rm -rf $PATH_PROJECT/logyou/*.egg
    echo "install web already : $PATH_PROJECT/logyou/"
    
	#install libs update
	sudo $PATH_PROJECT/django/bin/pip install -U certifi idna urllib3
	sudo $PATH_PROJECT/django/bin/pip install chardet
	
	#########
	mkdir /home/uih/setup-logcollector/logyou_app/app
	mkdir /home/uih/setup-logcollector/logyou_app/app/logs

	cd $PATH_EGG/uih-log-collector-management
	source env_server.sh

	#migrate database
	$PATH_PROJECT/django/bin/python manage.py migrate

	#create static file
	$PATH_PROJECT/django/bin/python manage.py collectstatic


	rm -rf mkdir /home/uih/setup-logcollector/logyou_app/app

    cd $CURRENT_PATH
    sudo cp -Rf $PATH_EGG/* $PATH_PROJECT/logyou

    sudo chown -Rf $RUNNER_USER:$RUNNER_GROUP $PATH_PROJECT
    sudo chmod 755 $PATH_PROJECT
	
}

#add logyou to service
function auto_start_web(){
    #PATH_PID="/var/run/logyou/"
    
    #sudo rm -Rf $PATH_PID
    #sudo mkdir $PATH_PID
    #sudo chown -Rf $RUNNER_USER:$RUNNER_GROUP $PATH_PID
    
	#add uwsgi to home project 
	#
	#sudo rm -Rf $PATH_PROJECT/uwsgi
	#sudo cp -Rf $PATH_EGG/uwsgi $PATH_PROJECT
	
	#add service logyou
    sudo rm -Rf /etc/systemd/system/logyou.service
    sudo cp $PATH_EGG/logyou.service /etc/systemd/system/logyou.service

	#create log uwsgi
	sudo mkdir /var/log/uwsgi
	sudo chown -Rf  $RUNNER_USER:$RUNNER_GROUP /var/log/uwsgi

	#copy uwsgi_rotate to /etc/logrotate.d
	sudo cp $PATH_EGG/uwsgi_rotate /etc/logrotate.d
	
	#enable service logyou
	sudo systemctl enable logyou.service
	#start service logyou
	sudo systemctl restart logyou.service

}

function auto_start_web_old(){
    #PATH_PID="/var/run/logyou/"
    
    #sudo rm -Rf $PATH_PID
    #sudo mkdir $PATH_PID
    #sudo chown -Rf $RUNNER_USER:$RUNNER_GROUP $PATH_PID
    
    sudo rm -Rf /etc/init.d/logyou
    sudo cp $PATH_EGG/logyou /etc/init.d/
    sudo chmod 755 /etc/init.d/logyou
    
    sudo update-rc.d -f logyou remove
    sudo update-rc.d logyou defaults
    sudo update-rc.d logyou enable
    
    sudo systemctl start logyou
    echo "add service in /etc/init.d"
    ls -al /etc/init.d/logyou
}

#install mariadb
function install_mariadb(){
    sudo apt-get -y remove --purge mariadb-server mariadb-client
    sudo apt-get -y remove --purge mysql-server mysql-client mysql-common
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    
    sudo find / -iname 'mysql*' -exec rm -Rf {} \;
    
    sudo apt-get install software-properties-common
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu bionic main'
    sudo apt -y update
    sudo apt-get install -y default-libmysqlclient-dev
    sudo DEBIAN_FRONTEND=noninteractive apt -y install mariadb-server mariadb-client
    
}


#create database and user
function create_database(){
    mysql -u root  -e "DROP DATABASE logcollector;"
    mysql -u root  -e "DROP USER 'logyou'@'localhost';"
    
    echo "Create Database : logcollector"
    mysql -u root  -e "CREATE DATABASE logcollector CHARACTER SET utf8 COLLATE utf8_general_ci;"
    echo "Create User Database : logyou"
    
    mysql -u root  -e "CREATE USER 'logyou'@'localhost' IDENTIFIED BY 'mKsnoRnmMY56';"
    mysql -u root  -e "GRANT ALL PRIVILEGES   ON *.* TO 'logyou'@'localhost';"
    
    mysql -u root  -e "FLUSH PRIVILEGES;"
    echo "Import Database..."
    mysql -u root  logcollector < $PATH_EGG/logcollector.sql
    echo "Import Database Success"
    mysql -u root  -e "select host,user,password from mysql.user;"
    #Change password root
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'logcollector@123';"
    mysql -u root  -e "FLUSH PRIVILEGES;"
    
    #echo "Enter mariadb root password:"
    #mysql -u root -p
    #echo "Finish install Mariadb"
}

function nginxlock_elk(){
    sudo apt-get install apache2-utils -y
    echo "###########################"
    echo "## Password for ELK lock ##"
    echo "###########################"
    sudo htpasswd -c /etc/nginx/.elkpasswd $RUNNER_USER
    
    sudo cp /etc/kibana/kibana.yml kibana.yml.old
    sudo cp /etc/kibana/kibana.yml kibana.yml
    sudo echo "server.basePath: \"/kibana\"" >> kibana.yml
    sudo echo "server.rewriteBasePath: true" >> kibana.yml
    sudo cp kibana.yml /etc/kibana/kibana.yml
    #sudo cp config_kibana/kibana.yml /etc/kibana/kibana.yml

    sudo cp /etc/elasticsearch/elasticsearch.yml elasticsearch.yml.old
    # Set ES Host Scope
    # Can use [_local_, _site_, _eno1_, 192.168.x.x]
    sudo echo "#network.host: [_local_, _ppp0_]" >> /etc/elasticsearch/elasticsearch.yml
    sudo echo "#discovery.seed_hosts: [_local_]" >> /etc/elasticsearch/elasticsearch.yml
    sudo echo "#cluster.initial_master_nodes: [_local_]" >> /etc/elasticsearch/elasticsearch.yml
    # Etc.
    sudo echo "search.max_buckets: 1000000" >> /etc/elasticsearch/elasticsearch.yml
    sudo echo "#node.attr.rack_id: rack_one" >> /etc/elasticsearch/elasticsearch.yml
    sudo echo "#cluster.routing.allocation.awareness.attributes: rack_one" >> /etc/elasticsearch/elasticsearch.yml
    
    sudo systemctl restart elasticsearch
    sudo systemctl restart kibana
    sudo systemctl restart nginx
}

function elk_tuning(){
    sudo cp -Rf /etc/logstash/jvm.options logstash.jvm.options.old 
    sudo sed -i "s/-Xms1g/-Xms"$LS_HEAP"g/g" /etc/logstash/jvm.options
    sudo sed -i "s/-Xmx1g/-Xmx"$LS_HEAP"g/g" /etc/logstash/jvm.options

    sudo cp -Rf /etc/elasticsearch/jvm.options elasticsearch.jvm.options.old 
    sudo sed -i "s/-Xms1g/-Xms"$ES_HEAP"g/g" /etc/elasticsearch/jvm.options
    sudo sed -i "s/-Xmx1g/-Xmx"$ES_HEAP"g/g" /etc/elasticsearch/jvm.options

    sudo systemctl restart logstash elasticsearch
}

function udp_tuning(){
    sudo cp /etc/sysctl.conf sysctl.conf.old
    echo "net.ipv4.tcp_rmem = 4096000 8388608 16777216" >> /etc/sysctl.conf
    echo "net.core.rmem_max = 33554432" >> /etc/sysctl.conf
    sudo sysctl -p /etc/sysctl.conf
    echo "set TCP and rmem ok"
}

function setup_theme(){
    sudo apt install -y jq zip
    mkdir old_theme
    mkdir -p old_theme/plymouth
    mkdir -p old_theme/update-motd.d
    
    sudo cp -rf /usr/share/plymouth/* old_theme/plymouth/
    sudo cp -rf /etc/update-motd.d/* old_theme/update-motd.d/
    sudo mv /etc/issue old_theme/
    
    sudo cp -rf logyou_theme/plymouth/* /usr/share/plymouth/
    
    sudo chmod +x logyou_theme/update-motd.d/*
    sudo cp -rf logyou_theme/update-motd.d/* /etc/update-motd.d/
    sudo cp -rf logyou_theme/issue /etc/issue
    
    sudo update-initramfs -u
}
function setup_version(){
    sudo cp -rf logyou_theme/bin/logyou /bin/
    sudo chmod +x /bin/logyou
}
function reinstall_kibana(){
    sudo apt remove kibana -y
    if [[ ! -d install_pack ]]
	then
        sudo apt install -y kibana 
	else
        sudo dpkg -i install_pack/kibana*.deb
    fi
    sudo systemctl restart kibana
}

function setES(){
    curl -XPUT "localhost:9200/_all/_settings" -H 'Content-Type: application/json' -d '{"index.max_result_window" : "1000000"}' -u $ELASTIC_USER:$ELASTIC_PASSWORD
    curl -XPUT "localhost:9200/_all/_settings" -H 'Content-Type: application/json' -d '{"index.blocks.read_only_allow_delete": "false"}' -u $ELASTIC_USER:$ELASTIC_PASSWORD
    #curl -XPUT "localhost:9200/_ilm/policy/logyou_policy" -H 'Content-Type: application/json' -d @config_logstash/logyou_policy -u $ELASTIC_USER:$ELASTIC_PASSWORD
    #curl -XPUT "localhost:9200/com*/_settings" -H 'Content-Type: application/json' -d'{ "index.lifecycle.name": "logyou_policy"}' -u $ELASTIC_USER:$ELASTIC_PASSWORD
    #curl -XPOST "localhost:9200/_ilm/start" -u $ELASTIC_USER:$ELASTIC_PASSWORD
    curl -XPUT "localhost:9200/_settings" -H 'Content-Type: application/json' -d'{ "index" : { "number_of_replicas" : 0 }}' -u $ELASTIC_USER:$ELASTIC_PASSWORD
    curl -XPUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'{"persistent": {"cluster.routing.allocation.disk.watermark.low": "80%","cluster.routing.allocation.disk.watermark.high": "85%","cluster.routing.allocation.disk.watermark.flood_stage": "90%","cluster.info.update.interval": "1m"}}' -u $ELASTIC_USER:$ELASTIC_PASSWORD

    sudo systemctl restart elasticsearch
}
#step 20 rollback
function rollback(){
    
    sudo cp /etc/logstash/logstash.yml logstash.yml
    sudo sed -i '/http.host:/d' logstash.yml
    sudo sed -i '/pipeline.batch.size:/d' logstash.yml
    sudo sed -i '/pipeline.batch.delay:/d' logstash.yml
    sudo cp logstash.yml /etc/logstash/logstash.yml
    echo "rollback /etc/logstash/logstash.yml already"
    
    sudo cp /etc/environment environment
    sudo sed -i '/JAVA_HOME/d' environment
    sudo cp environment /etc/environment
    unset $JAVA_HOME
    echo "rollback /etc/environment already"
    
    sudo cp -rf $CRONTAB_FILE.old $CRONTAB_FILE
    sudo cp -rf $CRONTAB_ROOT.old $CRONTAB_ROOT
    
    sudo rm -Rf  $LOGSTASH_FOLDER_OUTPUT
    sudo rm -Rf  $BACKUP_FOLDER
    #remove private key
    sudo rm -rf `eval echo ~$OWN_USER`/.ssh/id_rsa
    #remove all crontab
    sudo crontab -u $RUNNER_USER -r
    
    sudo ufw reset
    sudo ufw status numbered
    
    sudo cp -rf old_theme/plymouth/* /usr/share/plymouth/
    sudo cp -rf old_theme/update-motd.d/* /etc/update-motd.d/
    sudo rm -rf /etc/issue
    sudo cp -rf old_theme/issue /etc/
    sudo update-initramfs -u
    
    sudo rm -rf /bin/logyou
}


if [ -z $1 ]
then
    echo "variable sudo ./setup-logstash.sh install : setup all or"
    echo "sudo ./setup-logstash.sh config_time : setup only time and time sync"
    echo "sudo ./setup-logstash.sh install_el : setup only logstash and elasticsearch "
    echo "sudo ./setup-logstash.sh config_logyou : copy file for config to send data to webserver "
    echo "sudo ./setup-logstash.sh install_key : copy private key to .ssh"
    echo "sudo ./setup-logstash.sh install_crontab : copy crontab to crontab server"
    echo "sudo ./setup-logstash.sh config_logstash : copy config logstash"
    echo "sudo ./setup-logstash.sh setup_web : setup web logyou"
    echo "sudo ./setup-logstash.sh setup_mariadb : install mariadb and create database"
    echo "sudo ./setup-logstash.sh setup_version : setup version info"
    echo "sudo ./setup-logstash.sh setup_theme : setup wellcome theme"
    echo "sudo ./setup-logstash.sh rollback : rollback only logstash and environment"
else
    if [ $1 = "install" ]
    then
        echo "start install"
        syncTimeServer
        installJava8
        installELK
        installNginx
        createUser
        createFolder
        copyConfig
        setPrivateKey
        setupConfigLogstash
        elk_tuning
        startELKService
        
        setupCrontab
        install_mariadb
        create_database
        
        setup_python
        setup_env
        install_egg
        auto_start_web
        
        reinstall_kibana
        nginxlock_elk
        
        setup_theme
        setup_version
        
        setES
        #udp_tuning
        allowport
    
    elif [ $1 =  "install_elk" ]
    then
        echo "start install"
        syncTimeServer
        installJava8
        installELK
        installNginx
        createUser
        createFolder
        copyConfig
        setPrivateKey
        setupCrontab
        setupConfigLogstash
        elk_tuning
        startELKService
        nginxlock_elk
        setup_theme
        setup_version
        setES
        allowport
        #udp_tuning

    elif [ $1 = "setES" ]
    then
        echo "start setES"
        setES
    elif [ $1 = "setUDP" ]
    then
        echo "start setUDP"
        udp_tuning
    elif [ $1 = "config_logyou" ]
    then
        echo "start install config web"
        copyConfig
    elif [ $1 = "install_key" ]
    then
        echo "start install private key"
        setPrivateKey
    elif [ $1 = "install_crontab" ]
    then
        echo "start install crontab"
        setupCrontab
    elif [ $1 = "config_logstash" ]
    then
        echo "start config logstash"
        setupConfigLogstash
        
    elif [ $1 = "config_time" ]
    then
        echo "start config Time sync"
        syncTimeServer
        
    elif [ $1 = "setup_web" ]
    then
        echo "setup web logyou"
        setup_python
        setup_env
        install_egg
        auto_start_web
        
    elif [ $1 = "setup_mariadb" ]
    then
        echo "setup mariadb"
        install_mariadb
        create_database
        
    elif [ $1 = "setup_version" ]
    then
        echo "setup version"
        setup_version
        echo $(logyou)
        
    elif [ $1 = "setup_theme" ]
    then
        echo "setup theme"
        setup_version
        setup_theme

    elif [ $1 = "patch" ]
    then
        echo "start patch"
        ./patch.sh -b $BACKUP_FOLDER
        
    elif [ $1 = "rollback" ]
    then
        echo "start rollback"
        rollback
        
    elif [ $1 = "init_data" ]
    then
        echo "start rollback"
        create_database
        sudo rm -Rf  $BACKUP_FOLDER/backup_log/*
        sudo rm -Rf  $BACKUP_FOLDER/zip_log/*
        restart_service.sh
        
    else
        echo "$1"
    fi
fi



