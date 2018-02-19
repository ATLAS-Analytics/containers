#!/bin/bash

echo "Setting up DDM data collector"
git clone https://github.com/ATLAS-Analytics/DDMaccounting.git

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

echo "========= all set up. ============"

cd DDMaccounting/import/
ls
echo "========== executing =========="
./run.sh

echo "All DONE."