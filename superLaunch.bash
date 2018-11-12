#!/bin/bash

exec > >(tee -ia ~/log.txt)
exec 2>&1

date '+%A %W %Y %X'

echo "Running annotmined"

python annotmined_launcher.py

date '+%A %W %Y %X'
echo "Running annot

python annot_launcher.py



