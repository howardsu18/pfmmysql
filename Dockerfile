FROM mysql:5.6

MAINTAINER howardsu <howardsu18@gmail.com>

ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

ENV WORK_PATH /usr/local/work

ENV SETUP_SHELL setup.sh

ENV SQL_FILE pfm.sql

ENV SQL_INIT_DATA pfm_init_data.sql

RUN mkdir -p $WORK_PATH

COPY ./$SQL_FILE $WORK_PATH

COPY ./$SQL_INIT_DATA $WORK_PATH

COPY ./$SETUP_SHELL $AUTO_RUN_DIR/

RUN chmod -R 777 $AUTO_RUN_DIR/$SETUP_SHELL
