#!/bin/bash

sudo docker run -d -p 80:81 -v ./nginx/nginx.conf:/etc/nginx/nginx.conf simple_docker/task_4:1.0
