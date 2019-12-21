#!/bin/bash

stack_type=$2
network_stack="${3:-cloud-network}"
network_template="${4:-network.cf.yml}"
network_params="${5:-network.cf.json}"

server_stack="${3:-cloud-servers}"
server_template="${4:-server.cf.yml}"
server_params="${5:-server.cf.json}"

create_stack() {
  echo "[$1] creating $stack_type stack"
  aws cloudformation create-stack \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --capabilities CAPABILITY_IAM
  return 0
}

update_stack() {
  echo "[$1] updating $stack_type stack"
  aws cloudformation update-stack \
  --stack-name $1 \
  --template-body file://$2 \
  --parameters file://$3 \
  --capabilities CAPABILITY_IAM
  return 0
}

if [ "$#" -lt 2 ]
then
  echo 'You must enter at least two parameters'
  exit 1
fi

if [ $1 != 'create' -a $1 != 'update' ]
then
  echo 'First parameter must be "create" or "update"'
  exit 1
fi

if [ $2 != 'network' -a $2 != 'server' ]
then
  echo 'Second parameter must be "network" "server"'
  exit 1
fi

if [ $1 == 'create' ]
then
  if [ $2 == 'network' ]
  then
    create_stack $network_stack $network_template $network_params
  else
    create_stack $server_stack $server_template $server_params
  fi
else
  if [ $2 == 'network' ]
  then
    update_stack $network_stack $network_template $network_params
  else
    update_stack $server_stack $server_template $server_params
  fi
fi