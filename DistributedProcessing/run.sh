#!/bin/bash

echo "Setting up Distributed Processing data collector"
git clone https://github.com/ATLAS-Analytics/DistributedProcessing.git

echo "========= all set up. ============"

cd DistributedProcessing/container/$1/
ls
echo "========== executing $1 =========="
./run.sh

rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with the job. Exiting."
    exit $rc; 
fi

echo "All DONE."