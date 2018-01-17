#!/bin/bash

# . /environment

echo $PATH
echo "========= all set up. ============"

ls

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

"$@"