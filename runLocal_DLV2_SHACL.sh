#!/bin/bash


ROOT_PATH=$(pwd)
DLV2_PATH="DLV2"
SHACL_PATH="SHACL/SHACL_files"
EXE_PATH=$DLV2_PATH
CORPUS_PATH="CORPUS"
CMD="/usr/bin/time -v ./dlv2 ./dlv2SparqlABoxEndpoint.asp ./rules.asp" 
DEBUG=1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    echo "No argument supplied"
    echo "USAGE: sh runLocal_DLV2_SHACL.sh [dlv2|shacl] [debug]"
    echo "EXAMPLE: sh runLocal_DLV2_SHACL.sh dlv2"
    exit 1
elif [ $1 = "shacl" ]; then
    EXE_PATH=$SHACL_PATH
    cd $EXE_PATH
    javac -cp .:./lib/* DetectViolationsOnCorpus.java
    cd $ROOT_PATH
    CMD="/usr/bin/time -v java -cp .:./lib/* -Dfile.encoding=utf-8 DetectViolationsOnCorpus licenceusecaseTBox.owl riolOntology.owl regulativerules.ttl compliancerules.ttl"
elif [ $1 = "dlv2" ]; then
    CMD="/usr/bin/time -v ./dlv2 ./rules_local.asp"
else
    echo "Argument not valid"
    exit 1
fi

if [ -z "$2" ]; then
    DEBUG=0
    RED=''
    GREEN=''
    NC=''
fi

RESULT_FILE="results_$1_local.txt"
files=$(ls -v $CORPUS_PATH)

rm $RESULT_FILE


total_time=0
echo "Instance,Type,Time"
for F in $files; do

    cd $ROOT_PATH
    cd $EXE_PATH

    if [ $DEBUG -eq 1 ]; then
        >&2 echo "EXECUTING $1 WITH $F"
        pwd
        >&2 echo $CMD "$ROOT_PATH/$CORPUS_PATH/$F >> $ROOT_PATH/$RESULT_FILE 2>&1"
    fi

    # START REASONER LOCALLY AND COMPUTE EXECUTION TIME
    start=`date +%s.%N`
    $CMD $ROOT_PATH/$CORPUS_PATH/$F >> $ROOT_PATH/$RESULT_FILE 2>&1
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