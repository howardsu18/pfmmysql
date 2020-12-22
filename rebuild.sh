#!/bin/bash

#docker build -t pfmmysql:0.1 .

docker login hub.suh.com

docker tag pfmmysql:0.1 hub.suh.com/pfm/pfmmysql:0.1

docker push hub.suh.com/pfm/pfmmysql:0.1
