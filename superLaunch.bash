#!/bin/bash

exec > >(tee -ia ~/log.txt | tee -ia >(grep -e 'BLUE4' -e 'Date' >> ~/shortLog.txt))
exec 2>&1

echo "Date: $(date '+%A %W %Y %X')"

echo "Running annotmined\n"

python annotmined_launcher.py

echo "Date: $(date '+%A %W %Y %X')"
echo "Running annot\n"

python annot_launcher.py

date '+%A %W %Y %X'
echo "Date: $(date '+%A %W %Y %X')"
echo "Done!"

