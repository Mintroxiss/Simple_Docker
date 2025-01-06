#!/bin/bash

# Удаление существующего образа и пересборка с помощью Dockerfile
sudo docker rmi -f simple_docker/task_4:1.0 && sudo docker build . -t simple_docker/task_4:1.0
