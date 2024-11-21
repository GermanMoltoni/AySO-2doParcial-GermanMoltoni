#!/bin/bash
#Creo particiones y cambio el tipo según corresponda.
sudo fdisk /dev/sdc << EOF
n
p


+1G
t
82
n
p


+1G
t
2
8E
n
p


+1G
t
3
8E
n
e

+3G
n

+1.5G
t
5
8E
n

+1.3G
t
6
8E
w
EOF
# Doy formato y habilito swap
sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1
swapon -s
free -h
#Creo volumenes físicos
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
#Creo grupo de volumenes físicos
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
#Verifico vol. físicos.
sudo vgs

#Creo volumenes lógicos
sudo lvcreate -L 1.99G vgAdmin -n lvAdmin
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L 848M vgDevelopers -n lvDevops
#Verifico vol. lógicos
sudo lvs

#Creo doy formato a los volumenes lógicos
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo lsblk -f
#Creo directorios para montar los lv
sudo mkdir /mnt/lvAdmin
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
#Monto los volumenes lógicos
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
df -h
lsblk -f
