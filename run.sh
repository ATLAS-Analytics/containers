#!/bin/bash

# . /environment

echo "========= base set up. ============"

export SQOOP_HOME=/usr/local/sqoop
export PATH=$PATH:$SQOOP_HOME/bin

echo $PATH
ls

"$@"