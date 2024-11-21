#!/bin/bash
docker run  -d -p 8080:80 shermanet/2parcial-ayso:v1.0
docker ps
#Verifico si puedo acceder a las páginas
#curl http://192.168.56.8:8080/index.html
#curl http://192.168.56.8:8080/contacto.html
