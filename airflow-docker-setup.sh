#!/bin/bash

echo "Started bash script.."

#downloading docker-compose.yaml file
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.3/docker-compose.yaml'

#create few more directories recommended by airflow
mkdir ./dags ./logs ./plugins

#create environment file
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

# intializing the airflow docker, but before that docker compose should be installed ( https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04 )
# to install desktop --> https://docs.docker.com/desktop/install/linux-install/
# Docker engine VS Docker compose --> docker engine is used when we want to handle only one container whereas the docker-compose is used when we have multiple containers to handle.
# Sometimes you will get erro of "TLS Handshake timeout in Docker" --> for this try "sudo systemctl restart docker" and if possible restart the system aswell.
sudo docker-compose up airflow-init

# starting airflow docker
sudo docker-compose up

echo "If everything goes well.. Open localhost:8080"

#End
