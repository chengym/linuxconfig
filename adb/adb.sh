#!/bin/sh
while true
do
    sudo sync
    sudo adb root
    sudo adb remount
    sudo adb shell
    sleep 1s
done
