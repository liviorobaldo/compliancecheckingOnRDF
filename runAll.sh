#!/bin/bash

sh runFuseki_DLV2_SHACL.sh dlv2 first 2>/dev/null 
wait
sh runFuseki_DLV2_SHACL.sh shacl csv 2>/dev/null 
wait
sh runLocal_DLV2_SHACL.sh dlv2 csv 2>/dev/null
wait
sh runLocal_DLV2_SHACL.sh shacl csv 2>/dev/null
