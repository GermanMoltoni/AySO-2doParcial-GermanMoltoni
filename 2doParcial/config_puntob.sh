#!/bin/bash
#Genero clave para ssh usada por ansible
ssh-keygen
#Copio clave al server de desarrollo
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.56.9
