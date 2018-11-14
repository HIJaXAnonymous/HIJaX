#!/bin/bash
set -e

echo "Starting setup, this may take some time..."

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WDIR=`pwd`

# Get the data
#wget http://www.phontron.com/download/conala-corpus-v1.1.zip
#unzip conala-corpus-v1.1.zip


# Extract data 
cd $WDIR/conala-corpus

python $SDIR/preproc/our_extract_raw_data.py 1 # > raw_data.txt

python $SDIR/preproc/json_to_seq2seq.py conala-train.json.seq2seq conala-train.intent conala-train.snippet
python $SDIR/preproc/json_to_seq2seq.py conala-test.json.seq2seq conala-test.intent conala-test.snippet
python $SDIR/preproc/json_to_seq2seq.py conala-mined.jsonl.seq2seq conala-mined.intent conala-mined.snippet

cd ..

rm conala-corpus-v1.1.zip

echo "Done!"
