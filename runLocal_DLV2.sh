#!/bin/bash


ROOT_PATH=$(pwd)
DLV2_PATH="DLV2"
CORPUS_PATH="CORPUS"
DEBUG=1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    DEBUG=0
    RED=''
    GREEN=''
    NC=''
fi


RESULT_FILE="results_dlv2_local.txt"


files=$(ls -v $CORPUS_PATH)

rm $RESULT_FILE


total_time=0
echo "Instance,Type,Time"
for F in $files; do

    cd $ROOT_PATH
    cd $DLV2_PATH

    if [ $DEBUG -eq 1 ]; then
        >&2 echo "EXECUTING DLV2 WITH $F"
        pwd
        >&2 echo "./dlv2 ./rules_local.asp $ROOT_PATH/$CORPUS_PATH/$F >> $ROOT_PATH/$RESULT_FILE 2>&1"
    fi
    # START DLV2 LOCALLY AND COMPUTE EXECUTION TIME
    start=`date +%s.%N`
    /usr/bin/time -v ./dlv2 ./rules_local.asp $ROOT_PATH/$CORPUS_PATH/$F >> $ROOT_PATH/$RESULT_FILE 2>&1
    end=`date +%s.%N`
    current_time=`echo "$end - $start" | bc | sed 's/^\./0./'`
    total_time=`echo "$current_time + $total_time" | bc | sed 's/^\./0./'`
    if [ $DEBUG -eq 1 ]; then
        >&2 echo "Execution Time: END:" $end " START " $start " CURRENT: " $current_time
    fi
    echo "${RED}$F,local,${GREEN}$current_time${NC}"

    cd $ROOT_PATH
done
echo 'Total Time:' $total_time
