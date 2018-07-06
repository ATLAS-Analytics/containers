#!/bin/bash

# . /environment

echo "========= base set up. ============"

export SQOOP_HOME=/usr/local/sqoop
export PATH=$PATH:$SQOOP_HOME/bin
export HADOOP_OPTS=-Djava.security.egd=file:/dev/../dev/urandom
export LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib:$LD_LIBRARY_PATH

echo $PATH
ls

"$@"