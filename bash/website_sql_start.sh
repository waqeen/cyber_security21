#!/bin/bash

cd ../images/website
docker-compose config
docker-compose up -d
cd ../../bash
