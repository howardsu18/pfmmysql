#!/bin/bash

mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
source $WORK_PATH/$SQL_FILE;
source $WORK_PATH/$SQL_INIT_DATA;
