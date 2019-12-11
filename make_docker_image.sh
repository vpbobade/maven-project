#!/bin/bash

mkdir -p /opt/docker_image
cp -rf /var/lib/jenkins/workspace/Q_pipeline/Dockerfile /opt/docker_image
cp -rf /var/lib/jenkins/workspace/Q_pipeline/webapp/target/*.war /opt/docker_image
cp -rf /var/lib/jenkins/workspace/Q_pipeline/webapp/target/*.war /var/lib/jenkins/workspace/
docker build -f Dockerfile  -t vpbobade/mydockerimage:1.0.0 . > docker_out
image_name=`cat docker_out | tail -1 | awk -F' ' ' { print $3 } '` 
echo "Image created as $image_name"
