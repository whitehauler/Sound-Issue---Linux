#!/bin/bash

# author : reharish
# Script : Sound-Issue Resolve
# Description : This script will permanently disable a cracking or poping sound or low frequency continuous noise produced when using headphones. Which makes some people severe problems. this is due to power save mode enabled on a driver.

resolve(){
if test -f /sys/module/snd_hda_intel/parameters/power_save; 
then
	cat /sys/module/snd_hda_intel/parameters/power_save
	echo "0" | sudo tee /sys/module/snd_hda_intel/parameters/power_save
	echo "Done"
	# "Disabling Power Save option For a sound card"
	echo "options snd_hda_intel power_save=0" | sudo tee -a /etc/modprobe.d/audio_disable_powersave.conf
	cat /sys/module/snd_hda_intel/parameters/power_save
	cat /sys/module/snd_hda_intel/parameters/power_save_controller
	cat /sys/module/snd_hda_intel/parameters/power_save
	echo "N" | sudo tee /sys/module/snd_hda_intel/parameters/power_save_controller
	echo "options snd_hda_intel power_save_controller=N" | sudo tee -a /etc/modprobe.d/audio_disable_powersave_controller.conf
	echo
	echo "Resolved...Enjoy..!!!!!"
else
	echo "Driver snd_hda_intel not found ! "
fi
}

welcome(){
echo
echo "Sound Issue Resolve - Linux"
echo
echo "Please Run it as Root !!!"
echo
}

welcome
resolve
