#!/bin/bash

docker pull kalilinux/kali-rolling
docker run -d -t -i kalilinux/kali-rolling /bin/bash