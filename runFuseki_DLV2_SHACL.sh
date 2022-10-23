#!/bin/bash


NESTAT="netstat -tupan"
if uname -a | grep -i 'microsoft' >/dev/null; then
    if ! uname -a | grep -i 'WSL2' >/dev/null; then
        NETSTAT="netstat.exe -an"
    fi
fi

ROOT_PATH=$(pwd)
FUSEKI_PATH="FUSEKI/fuseki"
DLV2_PATH="DLV2"
SHACL_PATH="SHACL/SHACL_fuseki"
EXE_PATH=$DLV2_PATH
CORPUS_PATH="CORPUS"
CMD="/usr/bin/time -v ./dlv2 ./dlv2SparqlABoxEndpoint.asp ./rules_remote.asp" 
DEBUG=1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    echo "No argument supplied"
    echo "USAGE: sh runFuseki_DLV2_SHACL.sh [dlv2|shacl] [debug]"
    echo "EXAMPLE: sh runFuseki_DLV2_SHACL.sh dlv2"
    exit 1
elif [ $1 = "shacl" ]; then
    EXE_PATH=$SHACL_PATH
    cd $EXE_PATH
    javac -cp .:./lib/* fusekiSparqlEndpointClient.java
    cd $ROOT_PATH
    CMD="/usr/bin/time -v java -cp .:./lib/* -Dfile.encoding=utf-8 fusekiSparqlEndpointClient licenceusecaseTBox.owl riolOntology.owl regulativerules.ttl compliancerules.ttl"
elif [ $1 = "dlv2" ]; then
    CMD="/usr/bin/time -v ./dlv2 ./dlv2SparqlABoxEndpoint.asp ./rules_remote.asp"
else
    echo "Argument not valid"
    exit 1
fi

if [ -z "$2" ]; then
    DEBUG=0
    RED=''
    GREEN=''
    NC=''
elif [ "$2" = "csv" ]; then
    DEBUG=2
    RED=''
    GREEN=''
    NC=''
elif [ "$2" = "first" ]; then
    DEBUG=3
    RED=''
    GREEN=''
    NC=''
fi

RESULT_FILE="results_$1_remote.txt"


files=$(ls -v $CORPUS_PATH)

rm $RESULT_FILE


total_time=0
if [ $DEBUG -ne 2 ]; then
    echo "Instance,Reasoner,Type,Time"
fi

for F in $files; do

    if [ $DEBUG -eq 1 ]; then
        >&2 echo "EXECUTING SERVER WITH $F"
    fi
    # START FUSEKI SERVER WITH ALL THE FILES CONTRAINED IN THE CORPUS DIRECTORY (ONE BY ONE)
    cd $FUSEKI_PATH
    java -Xmx1200M -jar fuseki-server.jar --file ../../$CORPUS_PATH/$F /ABox 2> /dev/null & 
    server_pid=$!

    cd $ROOT_PATH
    cd $EXE_PATH

    # WAIT UNTIL THE FUSEKI SERVER IS LISTENING ON ITS DEFAULT PORT (PORT 3030)
    server_started=$($NETSTAT 2> /dev/null | grep 3030 | grep "LISTEN" | wc -l)
    while [ $server_started -lt 1 ]
    do
        server_started=$($NETSTAT 2> /dev/null | grep 3030 | grep "LISTEN" | wc -l)
    done

    if [ $1 = "shacl" ]; then
        CMD="/usr/bin/time -v java -cp .:./lib/* -Dfile.encoding=utf-8 fusekiSparqlEndpointClient licenceusecaseTBox.owl riolOntology.owl regulativerules.ttl compliancerules.ttl $F"
        if [ $DEBUG -eq 1 ]; then
            echo $CMD
        fi
    fi
    
    # START DLV2/SHACL PROCESS AND COMPUTE THE EXECUTION TIME
    start=`date +%s.%N`
    $CMD >> $ROOT_PATH/$RESULT_FILE 2>&1
    end=`date +%s.%N`
    current_time=`echo "$end - $start" | bc | sed 's/^\./0./'`
    total_time=`echo "$current_time + $total_time" | bc | sed 's/^\./0./'`
    if [ $DEBUG -eq 1 ]; then
        >&2 echo "Execution Time: END:" $end " START " $start " CURRENT: " $current_time
    fi
    echo "${RED}$F,$1,remote,${GREEN}$current_time${NC}"

    # KILL FUSEKI SERVER AND ITERATE OVER ALL THE OTHER CORPUS FILES
    while kill -0 $server_pid 2> /dev/null; do
        kill $server_pid 2> /dev/null
    done

    #kill $server_pid
    cd $ROOT_PATH
    #sleep 1
done

if [ $DEBUG -lt 2 ]; then
    echo 'Total Time:' $total_time
fi