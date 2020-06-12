#!/bin/bash

#Color
red="\e[1;31m"
reset="\e[0m"
Lred="\e[91m"
#Default Value
USER="logyou"
WEB_CHK_HOST="https://logyou.uih.co.th"
WEB_CHK_USER="log"
WEB_CHK_PASS="log@123"

function setNewKey(){
	VIEWER_PATH=`eval echo ~$USER`
	sudo mkdir -p $VIEWER_PATH/.ssh
	sudo cp -rf $SSH_KEY_DIR/* $VIEWER_PATH/.ssh/
	sudo chmod 700 -R $VIEWER_PATH/.ssh
	sudo chmod 700 -R $VIEWER_PATH/.ssh
	sudo chown -R $USER:`id -gn $USER` $VIEWER_PATH/.ssh
	echo "set key to $USER ok"
}

function setNewSFTP(){
	mkdir config_used
	cp -Rf config/sftp.sh config_used/sftp.sh
	sed -i "s/\[SFTP_HOST\]/$SFTP_HOST/" config_used/sftp.sh
	sed -i "s/\[SFTP_USER\]/$SFTP_USER/g" config_used/sftp.sh
	sudo chmod 755 config_used/*
	sudo cp -Rf config_used/sftp.sh /home/$USER/logging/logdata_backup_and_zip
	rm -rf config_used
	echo "set SFTP to $USER ok"
}

function setNewWebKey(){
	echo "$RESULT" > web_key
	sudo cp web_key $BACKUP_FOLDER/web_key
    export WEB_KEY=$RESULT
	sudo chown -R logyou:logstash $BACKUP_FOLDER

	sudo cp /etc/environment environment.old.b4patch
	sudo cp /etc/environment .
	sudo sed -i "s/WEB_KEY=.*/WEB_KEY=\"$RESULT\"/" environment
	sudo cp environment /etc/environment

	echo "set web_key to $USER ok"
}

function setNewLCKey(){
	sudo echo "$LC_KEY" > $BACKUP_FOLDER/lc_key
	sudo chown -R logyou:logstash $BACKUP_FOLDER
	sudo rm -rf cu.txt
	echo "Set new Licence key OK"
}

function chkWebKey(){
	sudo lshw -json > hw.json
	SEND_COUNTER=0
	while [ 1 ]
	do
		curl -X POST -k -H 'Content-Type: application/json' -i "$WEB_CHK_HOST/logyou/api/getuuid/$company_id" -d @hw.json > cu.txt
		STATUS_CODE=`grep -w 'cu.txt' -e 'HTTP/2 200' | cut -d ' ' -f 2`
		RESULT=`cat cu.txt | tail -n 1`
		echo "Status code "$STATUS_CODE

		if [[ "$STATUS_CODE" == "200" && $RESULT == "error" ]]; then
			echo "Get Key Error"
			break
		elif [[ "$STATUS_CODE" == "200" && $RESULT == "out_of_stock" ]]; then
			echo -e "Key "$Lred"out_of_stock$reset"
			break
		elif [[ "$STATUS_CODE" == "200" ]]; then
			setNewWebKey
			break
		fi
		let SEND_COUNTER=SEND_COUNTER+1
		if [ $SEND_COUNTER == 3 ]; then
			echo "No response from server"
			break
		fi
		echo "API Error, Retry sending..."
		sleep 5
	done
	sudo rm -rf hw.json
	sudo rm -rf cu.txt
}

function patch_end(){
        echo "Program end"
        exit 1
}

function selCngSSH(){
	echo "Setting SSH key"
	while [ 1 ]
	do
		echo -n "Plese insert SSH key dir : "
		read ssh_k_d
		SSH_KEY_DIR=$ssh_k_d
		if [[ ! -d $SSH_KEY_DIR ]]
		then
			echo "You not select directory"
		else
			echo "Directory ok"
			echo -n "Please confirm (yes/no) : "
			read confirn_ssh
			case $confirn_ssh in
				y*) 	echo "Setting SSH"
						setNewKey
						break;;
				n*) 	continue;;
				*) 		break;;
			esac
		fi
	done
	main
}

function selCngSFTP(){
	while [ 1 ]
	do
		echo -n "Plese insert SFTP server : "
		read ftp_h
		SFTP_HOST=$ftp_h
		echo -n "Plese insert SFTP user : "
		read ftp_u
		SFTP_USER=$ftp_u

		echo "Your SFTP Host is $SFTP_HOST"
		echo "Your SFTP User is $SFTP_USER"
		echo -n "Please confirm (yes/no) : "
		read confirn_sftp
		case $confirn_sftp in
			y*) 	echo "Setting SFTP"
					setNewSFTP
					break;;
			n*) 	continue;;
			*) 		break;;
		esac

	done
	main
}

function selWebKey(){
	while [ 1 ]
	do
		echo -n "Plese insert Company ID : "
		read com_id
		company_id=$com_id

		echo "Your Company ID is $company_id"
		echo -n "Please confirm (yes/no) : "
		read confirn_uuid
		case $confirn_uuid in
			y*) 	echo "Setting UUID"
					chkWebKey
					break;;
			n*) 	continue;;
			*) 		break;;
		esac
	done
	echo -n "Do you want to continue to patch menu (yes/no) : "
	read confirn_NewWebKey
	case $confirn_NewWebKey in
		y*) main;;
		*) 	patch_end;;
	esac
}

function selGetLCKey(){
	web_key=`echo $WEB_KEY`
	#web_key="536d8742-0428-11e9-bf64-363e7066c79a"

	while [ 1 ]
	do
		curl -XPOST -k -H "Content-Type: application/json" \
		-H 'collector: 1234567890' \
		-u $WEB_CHK_USER:$WEB_CHK_PASS \
		-i $WEB_CHK_HOST/logyou/api/licence/generate/$web_key > cu.txt
		STATUS_CODE=`grep -w 'cu.txt' -e '200 OK' | cut -d ' ' -f 2`
		LC_KEY=`cat cu.txt | tail -n 1`
		echo "Status code "$STATUS_CODE
		echo "Get new Licence key OK"

		if [[ "$STATUS_CODE" == "200" && $LC_KEY == "None" ]]; then
			echo "Get Key Error"
			break
		elif [[ "$STATUS_CODE" == "200" ]]; then
			setNewLCKey
			echo -n "Do you want to continue to patch menu (yes/no) : "
			read confirn_getlckey
			case $confirn_getlckey in
				y*) main;;
				*) 	patch_end;;
			esac
			break
		fi
		let SEND_COUNTER=SEND_COUNTER+1
		if [ $SEND_COUNTER == 3 ]; then
			echo "No response from server"
			break
		fi
		echo "API Error, Retry sending..."
		sleep 5
	done
}

function selChkLCKey(){
	web_key=`echo $WEB_KEY`
	#web_key="536d8742-0428-11e9-bf64-363e7066c79a"

	if [ -f $BACKUP_FOLDER/lc_key ]
	then
		while [ 1 ]
		do
			curl -XPOST -k -H "Content-Type: application/json" \
			-H 'collector: 1234567890' \
			-u $WEB_CHK_USER:$WEB_CHK_PASS \
			-i $WEB_CHK_HOST/logyou/api/licence/check/$web_key \
			-d @$BACKUP_FOLDER/lc_key > cu.txt
			STATUS_CODE=`grep -w 'cu.txt' -e '200 OK' | cut -d ' ' -f 2`
			RESULT=`cat cu.txt | tail -n 1`
			sudo rm -rf cu.txt
			echo "Status code "$STATUS_CODE
			# echo "Result "$RESULT

			if [[ "$STATUS_CODE" == "200" && $RESULT == "error" ]]; then
				echo "Get Licence Key Error"
				break
			elif [[ "$STATUS_CODE" == "200" ]]; then
				echo "################## Your Licence ##########################"
				if [[ `echo $RESULT | jq '.licence'` == true ]]
				then
					echo "collector_used = $(echo ${RESULT} | jq '.collector_used')/$(echo ${RESULT} | jq '.collector_max')"
					echo "source_used = $(echo ${RESULT} | jq '.source_used')/$(echo ${RESULT} | jq '.source_max')"
				else
					echo "Your Licence Key is Invalid or Expire"
				fi
				echo "##########################################################"
				# echo $RESULT
				echo -n "Do you want to continue to patch menu (yes/no) : "
				read confirn_chklckey
				case $confirn_chklckey in
					y*) main;;
					*) 	patch_end;;
				esac
				break
			fi
			let SEND_COUNTER=SEND_COUNTER+1
			if [ $SEND_COUNTER == 3 ]; then
				echo "No response from server"
				break
			fi
			echo "API Error, Retry sending..."
			sleep 5
		done
	else
		echo "No LC file"
	fi
}

function main(){
	echo "#####################################"
	echo "select the operation number"
	echo "Try 1 to set SSH KEY"
	echo "Try 2 to change SFTP host and user"
	echo "Try 3 to change web key"
	echo "Try 4 to get licence key"
	echo "Try 5 to check licence status"
	echo "Try any to exit"
	echo "#####################################"
	echo -n "Please select your choice number : "
	read n
	case $n in
	1) selCngSSH;;
	2) selCngSFTP;;
	3) selWebKey;;
	4) selGetLCKey;;
	5) selChkLCKey;;
	*) patch_end;;
	esac
}

while getopts b: option
do
    case "${option}"
    in
		b) BACKUP_FOLDER=${OPTARG};;
    esac
done

main
