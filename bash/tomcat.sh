#!/bin/bash

docker search tomcat
docker pull tomcat
docker run -d -it -p 1234:8282 tomcat
