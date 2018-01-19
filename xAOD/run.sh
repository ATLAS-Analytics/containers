#!/bin/bash

echo "Setting up xAOD collector"

git clone https://github.com/ATLAS-Analytics/xAOD-analytics.git
echo "========= all set up. ============"

cd xAOD-analytics/container
ls
./run.sh