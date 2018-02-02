#!/bin/bash

echo "Setting up xAOD collector"
git clone https://github.com/ATLAS-Analytics/xAOD-analytics.git

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

echo "========= all set up. ============"

cd xAOD-analytics/container
ls
./run.sh