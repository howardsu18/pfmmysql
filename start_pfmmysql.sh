#!/bin/bash

sudo docker run -it \
  --name pfmmysql \
  -e MYSQL_ROOT_PASSWORD=12345 \
  -p 3306:3306 \
  --net=pfmnet \
  -v /pfmmysql/conf:/etc/mysql/conf.d \
  -v /pfmmysql/data:/var/lib/mysql \
  -d pfmmysql:0.1
