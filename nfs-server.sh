#!/bin/bash

nfs_path="/nfs-server/data"

sudo apt update && sudo apt install nfs-kernel-server -y

sudo mkdir -p $nfs_path
sudo chown -R nobody:nogroup $nfs_path
sudo chmod 777 $nfs_path

echo "$nfs_path *(rw,sync,no_subtree_check)" >> /etc/exports
#/folder-location *(rw,no_root_squash,no_subtree_check)

sudo exportfs -a
sudo systemctl restart nfs-kernel-server
