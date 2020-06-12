mv file in	systemback	to path	/usr/share/systemback
mv file in	plymouth		to path	/usr/share/plymouth

#reload boot system
sudo update-initramfs -u

mv file in	update-motd.d	to path	/etc/update-motd.d
mv file in	issue		to file	/etc/issue

mv file in	bin		to path	/bin