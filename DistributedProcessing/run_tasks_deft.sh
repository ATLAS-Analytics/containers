#!/bin/bash

echo "Setting up Distributed Processing data collector"
git clone https://github.com/ATLAS-Analytics/DistributedProcessing.git

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

echo "========= all set up. ============"

cd DistributedProcessing/container/Tasks/Enrich/DEFT/
ls
./run.sh
