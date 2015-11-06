#/bin/bash
# This script set command in mutliple remote server in remote servers.
# #Use private key to loging to remote server
# -l <link>
# -i <path of private key>
# -c <cmd>
IPARY=()
while [[ $# -gt 0 ]] # > is for string comparison
do
key="$1"
case $key in
    -l|--link)
    LINK="$2"
    shift # past argument
    ;;
    -c|--cmd)
    CMD="$2"
    shift # past argument
    ;;
    -i|--identity)
    IDPATH="$2"
    shift # past argument
    ;;
    *) # default
    IPARY+=($key)
            # unknown option
    ;;
esac
shift # past argument or value
done

for i in ${IPARY[@]};
do
    ssh -o StrictHostKeyChecking=no -i $IDPATH ${i} "$CMD"
done