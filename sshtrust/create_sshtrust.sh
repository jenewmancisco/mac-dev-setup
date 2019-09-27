#!/bin/bash

declare -a hosts_arr=(
    "fcinodeihs183.rtp.raleigh.ibm.com"
    "fcinode112.rtp.raleigh.ibm.com"
    "fcinode166.rtp.raleigh.ibm.com"
    "fci-iui1i1.fyre.ibm.com"
    "fci-em01a1.fyre.ibm.com"
)
declare -a name_arr=(
    "FCI1"
    "Env3"
    "Env4"
    "Env1"
    "Env2"
)

declare -a passwd_arr=(
    "PLTdocadmin1"
    "PLTdocadmin1"
    "PLTdocadmin1"
    "us3rpa88"
    "As12qwas!"
)
for ((i=0;i<${#hosts_arr[@]};++i)); do
    echo "${name_arr[i]} - ${hosts_arr[i]}"
    ~/Login_exp.sh ${passwd_arr[i]} ssh-copy-id -i ~/.ssh/id_rsa.pub root@${hosts_arr[i]}
done
