#!/bin/bash

sudo docker run -d -p 81:81 -v ./nginx/nginx.conf:/etc/nginx/nginx.conf simple_docker/task_3:1.0
