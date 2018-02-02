#!/bin/bash

echo "Cloning FTS collector"

git clone https://github.com/ivukotic/FTS_indexer.git 

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

echo "========= all set up. ============"

cd FTS_indexer
ls
./run.sh