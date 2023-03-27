#!/bin/sh

#local_interface=$(sudo route | awk '/^default/{print $NF}')
eth1=$(ip addr show eth1 | grep -w "inet" | awk '{ print $2; }' | sed 's/\/.*$//')
#eth0=$(ip addr show eth0 | grep -w "inet" | awk '{ print $2; }' | sed 's/\/.*$//')

#echo "$eth0"

echo "$eth1"
