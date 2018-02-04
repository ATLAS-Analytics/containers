#!/bin/bash

# . /environment

echo "========= base set up. ============"

export SQOOP_HOME=/usr/local/sqoop
export PATH=$PATH:$SQOOP_HOME/bin
export HADOOP_OPTS=-Djava.security.egd=file:/dev/../dev/urandom

echo $PATH
ls

"$@"