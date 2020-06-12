#!/bin/bash
#Product type
PD_TYPE="stand-alone"
#uih staff
OWN_USER="uih"
OWN_GROUP="uih"

#runner account
RUNNER_USER="logyou"
RUNNER_GROUP="logstash"
########################## S T A R T  C H A N G E ##########################
KEY="[KEY]"
WEB_HOST="http:\/\/192.168.0.121:8002"
WEB_USER="admin"
WEB_PASSWORD="abc@123"

SFTP_HOST="192.168.0.121"
SFTP_USER="logcom1"

SFTP_KEY="key_sftpserver"


ELASTIC_HOST="http:\/\/localhost:9200"
ELASTIC_USER=""
ELASTIC_PASSWORD=""
#COMPANY_NUMBER => get from database
COMPANY_NUMBER="0"
########################### E N D  C H A N G E ###########################

VIEWER_PATH=""
CRONTAB_FILE="log_crontab"

#logstash folder output
LOGSTASH_FOLDER_OUTPUT="/home/$RUNNER_USER/logging/logdata"
BACKUP_FOLDER="/home/$RUNNER_USER/logging/logdata_backup_and_zip"

#elastic pack version
ELASTIC_VERSION="6.x"
PACKAGE_ELASTIC="https://artifacts.elastic.co/packages/$ELASTIC_VERSION/apt"

###############################################################################
### start step								    ###
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
    
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    sudo apt install oracle-java8-installer -y
    sudo update-alternatives --config java
    sudo update-alternatives --config javac
    
    #set JAVA_HOME
    
    if [ -z "$JAVA_HOME" ]
    then
        java_path=`readlink -f $(which javac)`
        java_path=${java_path:0:-5}
        echo "find java path $java_path"
        
        sudo cp /etc/environment environment.old
        sudo cp /etc/environment .
        
        sudo sed -i "/\PATH/a JAVA_HOME=\"$java_path\""  environment
        sudo cp environment /etc/environment
        export JAVA_HOME="$java_path"
        #source /etc/environment
        echo $JAVA_HOME
        sudo setcap cap_net_bind_service=+epi "$java_path/java"
        # sudo echo "$java_path/java" >> /etc/ld.so.conf.d/logyou.conf
        # sudo ldconfig
        
        ########## START Hard Setting ###############
        sudo setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-oracle/jre/bin/java
        ########## END Hard Setting ###############
        echo "set up JAVA_HOME already"
    else
        echo "JAVA_HOME is not empty"
    fi
}

#step 2 install logstash
function installLogStash(){
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    echo "deb $PACKAGE_ELASTIC stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-$ELASTIC_VERSION.list
    sudo apt update
    sudo apt install logstash -y
    
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
    sudo echo "pipeline.batch.size: 125" >> logstash.yml
    sudo echo "pipeline.batch.delay: 50" >> logstash.yml
    
    sudo echo "config.reload.automatic: true" >> logstash.yml
    sudo echo "config.reload.interval: 3s" >> logstash.yml

    sudo cp logstash.yml /etc/logstash/logstash.yml
    
    #install plugin output
    sudo /usr/share/logstash/bin/logstash-plugin install logstash-output-syslog
}

#step 5 create user
function createUser(){
    echo "########################"
    echo "## Create logyou user ##"
    echo "########################"
    sudo adduser $RUNNER_USER
    sudo usermod -g $RUNNER_GROUP $RUNNER_USER
    VIEWER_PATH=`eval echo ~$RUNNER_USER`
}

#step 5 create folder
function createFolder(){
    echo "create floder"
    #LOGSTASH_FOLDER_OUTPUT="/logstash"
    #BACKUP_FOLDER="/logstash_backup_and_zip"
    sudo mkdir -p $LOGSTASH_FOLDER_OUTPUT
    sudo mkdir -p $LOGSTASH_FOLDER_OUTPUT/indexlog
    sudo mkdir -p $LOGSTASH_FOLDER_OUTPUT/origin
    sudo mkdir -p $BACKUP_FOLDER
    sudo mkdir -p $BACKUP_FOLDER/backup_log
    sudo mkdir -p $BACKUP_FOLDER/zip_log
    
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $LOGSTASH_FOLDER_OUTPUT
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $BACKUP_FOLDER
    
    sudo chmod 700 `eval echo ~$OWN_USER`
    
    ls -al $LOGSTASH_FOLDER_OUTPUT
    ls -al $BACKUP_FOLDER
}



#step 10 start logstash
function startLogStashService(){
    #enable logstash on start
    sudo systemctl enable logstash
    #reload deamon
    sudo systemctl daemon-reload
    #start logstash
    sudo systemctl restart logstash
    #start Logstash on boot up
    sudo update-rc.d logstash defaults 96 9
}

#set 7 copy files config
function copyConfig(){
    cp -Rf config config_used
    sed -i "s/\[KEY\]/$KEY/" config_used/curlsender.sh
    sed -i "s/\[WEB_HOST\]/$WEB_HOST/" config_used/curlsender.sh
    sed -i "s/\[WEB_USER\]/$WEB_USER/" config_used/curlsender.sh
    sed -i "s/\[WEB_PASSWORD\]/$WEB_PASSWORD/" config_used/curlsender.sh
    
    sed -i "s/\[SFTP_HOST\]/$SFTP_HOST/" config_used/sftp.sh
    sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/sftp.sh

    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chklastmod.sh
    sed -i 's|\[LOGSTASH_FOLDER_OUTPUT\]|'$LOGSTASH_FOLDER_OUTPUT'|g' config_used/chklastmod.sh

    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chkusage.sh

    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/chksize.sh
    
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/auto_delete.sh
    sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/g" config_used/auto_delete.sh
    sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/g" config_used/auto_delete.sh
    sed -i "s/\[ELASTIC_USER\]/$ELASTIC_USER/g" config_used/auto_delete.sh
    sed -i "s/\[ELASTIC_PASSWORD\]/$ELASTIC_PASSWORD/g" config_used/auto_delete.sh
    sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/auto_delete.sh
    
    sed -i 's|\[LOGSTASH_FOLDER_OUTPUT\]|'$LOGSTASH_FOLDER_OUTPUT'|g' config_used/start.sh
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/start.sh
    
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' config_used/ftp_start.sh
    
    OFFSET=$BACKUP_FOLDER'/sftp.sh $localdirname $filename $device $date_file $type'
    sed -i 's|\[OFFSET\]|'"$OFFSET"'|g' config_used/ftp_start.sh
    
    sudo chmod 755 config_used/*
    sudo cp -Rf config_used/* $BACKUP_FOLDER
    rm -Rf config_used
    
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $BACKUP_FOLDER
}

#step 8 set private key for sftp
function setPrivateKey(){
    sudo mkdir -p $VIEWER_PATH/.ssh
    sudo cat $SFTP_KEY >> $VIEWER_PATH/.ssh/id_rsa
    sudo chmod 600 $VIEWER_PATH/.ssh/id_rsa
    sudo chown -Rf $RUNNER_USER:$RUNNER_GROUP $VIEWER_PATH/.ssh
    #sudo sftp $SFTP_USER@$SFTP_HOST
    
    echo "set privatekey already"
}

#step 9 setup crontab
function setupCrontab(){
    sudo crontab -u $RUNNER_USER -r
    cp -rf $CRONTAB_FILE $CRONTAB_FILE.old
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' $CRONTAB_FILE
    sed -i "s/\[PD_TYPE\]/$PD_TYPE/g" $CRONTAB_FILE
    sudo crontab -u $RUNNER_USER $CRONTAB_FILE
    sudo crontab -u $RUNNER_USER -l
    echo "setup contrab already"
    
}

#step 10 config logstash
function setupConfigLogstash(){
    sudo cp config_logstash/logstash-syslog.conf logstash-syslog.conf.old
    sudo cp config_logstash/es-syslog.conf es-syslog.conf.old
    sudo cp config_logstash/fs-syslog.conf fs-syslog.conf.old
    sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/" config_logstash/es-syslog.conf
    sed -i "s/\[ELASTIC_USER\]/$ELASTIC_USER/g" config_logstash/es-syslog.conf
    sed -i "s/\[ELASTIC_PASSWORD\]/$ELASTIC_PASSWORD/g" config_logstash/es-syslog.conf
    sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/" config_logstash/es-syslog.conf
    sed -i "s|\[LOGSTASH_FOLDER_OUTPUT\]|$LOGSTASH_FOLDER_OUTPUT|g" config_logstash/fs-syslog.conf
    OUTPUT="  file{path => \""$LOGSTASH_FOLDER_OUTPUT"/indexlog/%{host}/%{+YYYY-MM-dd}/%{+YYYY-MM-dd-HH}.log\"}"
    sed -i "s|\[OUTPUT\]|$OUTPUT|g" config_logstash/fs-syslog.conf
    sudo cp -Rf /etc/logstash/pipelines.yml pipelines.yml.old
    sudo cp -Rf config_logstash/*.conf /etc/logstash/conf.d/
    sudo cp -Rf config_logstash/*.yml /etc/logstash/
    
    sudo chown -Rf $RUNNER_USER:$RUNNER_GROUP /var/log/logstash/
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP /var/lib/logstash/
}

#port config
function allowport(){
    sudo ufw allow 'OpenSSH'
    #sudo ufw allow 22/tcp
    sudo ufw allow 514/tcp
    sudo ufw allow 514/udp
    sudo ufw enable
    sudo ufw status numbered
}

function setup_theme(){
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

function setup_ftp2es(){
    cp ftp2es ftp2es_use
    
    sed -i "s/\[SFTP_HOST\]/$SFTP_HOST/" ftp2es_use/ftp_start.sh
    sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" ftp2es_use/ftp_start.sh
    sed -i 's|\[BACKUP_FOLDER\]|'$BACKUP_FOLDER'|g' ftp2es_use/ftp_start.sh
    OFFSET=$BACKUP_FOLDER'/sftp.sh $localdirname $filename $device $date_file $type'
    sed -i 's|\[OFFSET\]|'"$OFFSET"'|g' ftp2es_use/ftp_start.sh
    
    sed -i "s/\[SFTP_USER\]/$SFTP_USER/" ftp2es_use/ftp2es.sh
    sed -i "s/\[ELASTIC_HOST\]/$ELASTIC_HOST/g" ftp2es_use/ftp2es.sh
    sed -i "s/\[COMPANY_NUMBER\]/$COMPANY_NUMBER/g" ftp2es_use/ftp2es.sh
    
    scp ftp2es_use/ftp2es.sh $SFTP_USER@$SFTP_HOST:/home/$SFTP_USER/
    
    sudo chmod 755 ftp2es_use/ftp_start.sh
    sudo cp -Rf ftp2es_use/ftp_start.sh $BACKUP_FOLDER
    rm -Rf ftp2es_use
    
    sudo chown -R $RUNNER_USER:$RUNNER_GROUP $BACKUP_FOLDER
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
    
    sudo cp -rf logstash-syslog.conf.old config_logstash/logstash-syslog.conf
    sudo cp -rf $CRONTAB_FILE.old $CRONTAB_FILE
    
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
    echo "sudo ./setup-logstash.sh install_web : copy file for config to send data to webserver "
    echo "sudo ./setup-logstash.sh install_key : copy private key to .ssh"
    echo "sudo ./setup-logstash.sh install_crontab : copy crontab to crontab server"
    echo "sudo ./setup-logstash.sh config_logstash : copy config logstash"
    echo "sudo ./setup-logstash.sh rollback : rollback only logstash and environment"
else
    if [ $1 =  "install" ]
    then
        echo "start install"
        syncTimeServer
        installJava8
        installLogStash
        createUser
        createFolder
        copyConfig
        setPrivateKey
        setupConfigLogstash
        startLogStashService
        setupCrontab
        allowport
        setup_theme
        setup_version
        
    elif [ $1 = "install_web" ]
    then
        echo "start install only web"
        copyConfig
    elif [ $1 = "install_key" ]
    then
        echo "start install only web"
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
        
    elif [ $1 = "setup_version" ]
    then
        echo "setup version"
        setup_version
        echo $(logyou)
        
    elif [ $1 = "rollback" ]
    then
        echo "start rollback"
        rollback
        
    else
        echo "$1"
    fi
fi
