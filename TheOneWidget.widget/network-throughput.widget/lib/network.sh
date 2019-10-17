#!/bin/bash
CWD=/tmp/network_statistics_out
mkdir -p ${CWD}
function getBytes {
    netstat -w1 > ${1}/network.out & sleep 1.5; kill $!;
}
BYTES=$(getBytes ${CWD} > /dev/null);
BYTES=$(cat ${CWD}/network.out | grep '[0-9].*');
BYTES=$(echo $BYTES | awk '{print $3 "^" $6}');
echo $BYTES;
