#!/bin/bash

echo "Cloning FTS collector"

git clone https://github.com/ivukotic/FTS_indexer.git 

echo "========= all set up. ============"

cd FTS_indexer
ls
./run.sh

rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with the indexer. Exiting."
    exit $rc; 
fi