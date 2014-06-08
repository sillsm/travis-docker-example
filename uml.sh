#!/bin/bash

# Exit on first error
set -e

# Kill background processes on exit
trap 'kill $(jobs -p)' SIGINT SIGTERM EXIT

uname -a 
echo that was the current kernel
apt-get install sudo
sudo apt-get install debootstrap 
sudo apt-get install schroot
sudo mkdir -p /newmount
sudo debootstrap --variant=buildd trusty /newmount http://archive.ubuntu.com/ubuntu/
sudo mount -o bind /proc /newmount/proc
sudo cp /etc/resolv.conf /newmount/etc/resolv.conf
sudo chroot /newmount uname -a
# Start docker daemon
#docker -d &
#sleep 10

# Use docker
#docker run ubuntu /bin/echo hello world
