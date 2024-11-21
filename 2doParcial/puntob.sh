#!/bin/bash
ansible-playbook  -i ansible/inventory ansible/playbook.yml
#Compruebo si esta instalado en el host
echo 'Ingreso por ssh a host Desarrollo y verifico si se instaló apache'
ssh vagrant@192.168.56.9 -t "sudo apt list --installed | grep apache"
