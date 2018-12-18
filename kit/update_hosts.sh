#!/bin/bash
cwd="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

hosts=("arch" "wdh" "elementary")

iplookup() {
    if nmblookup "$1" >/dev/null
    then
        nmblookup "$1" | awk '{print $1}'
        return 0
    else
        return 1
    fi
}

for host in "${hosts[@]}"
do
    #awk -v hst=$host '$2!~/^hst&/ {print $0}' /etc/hosts  > /etc/hosts
    # grep -wiv $host
    if nmblookup "$host" >/dev/null;then
        sed -in "/\b$host\b/d" /etc/hosts
        echo "$(iplookup $host)" "$host" >> /etc/hosts
    fi
done

name=($(awk '{print $1}' "$DIR"/etc/iplist))
ip=($(awk '{print $2}' "$DIR"/etc/iplist))
for n in "${!name[@]}";
do
    sed -in "/\b${name[n]}\b/d" /etc/hosts
    echo "${ip[n]} ${name[n]}" >> /etc/hosts
done
cd "$cwd"
# vultr='207.246.111.84'
# sed -in "/\bvultr\b/d" /etc/hosts
# echo "$vultr vultr" >> /etc/hosts
# qtb='192.186.4.90'
# sed -in "/\bqtb\b/d" /etc/hosts
# echo "$qtb qtb" >> /etc/hosts
# centos='192.186.1.49'
# sed -in "/\bcentos\b/d" /etc/hosts
# echo "$centos centos" >> /etc/hosts
