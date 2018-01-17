#!/bin/bash

# . /environment

echo $PATH
echo "========= all set up. ============"

ls

echo "========= running kinit =========="
kinit analyticssvc@CERN.ch -k -t analyticssvc.keytab

"$@"