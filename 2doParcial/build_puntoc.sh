#!/bin/bash
docker login -u shermanet
docker build -t shermanet/2parcial-ayso:v1.0 .
docker push shermanet/2parcial-ayso:v1.0
