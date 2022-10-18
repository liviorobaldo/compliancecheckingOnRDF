#!/bin/bash


ROOT_PATH=$(pwd)
SHACL_PATH="SHACL/SHACL_files"


RESULT_FILE="results_shacl_local.txt"

rm $RESULT_FILE

time=0
echo "Instance,Type,Time"

    cd $SHACL_PATH
    # COMPILING JAVA CLASS
    javac -cp .:./lib/* DetectViolationsOnCorpus.java

    # RUNNING JAVA CLASS
    start=`date +%s.%N`
    /usr/bin/time -v java -cp .:./lib/* -Dfile.encoding=utf-8 DetectViolationsOnCorpus "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "../../CORPUS" $ROOT_PATH/$RESULT_FILE
    end=`date +%s.%N`

    time=`echo "$end - $start" | bc | sed 's/^\./0./'`

echo 'Total Time:' $time
