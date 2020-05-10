#!/bin/bash

#  _____       ______ _____ ___    _____                _         ___  
# |_   _|     |  ____/ ____|__ \  |  __ \              | |       |__ \ 
#   | |  ___  | |__ | |       ) | | |__) |___  __ _  __| |_   _     ) |
#   | | / __| |  __|| |      / /  |  _  // _ \/ _` |/ _` | | | |   / / 
#  _| |_\__ \ | |___| |____ / /_  | | \ \  __/ (_| | (_| | |_| |  |_|  
# |_____|___/ |______\_____|____| |_|  \_\___|\__,_|\__,_|\__, |  (_)  
#                                                          __/ |       
#                                                         |___/        

# Requires:
# - AWS CLI
# - jq

# Expects:
# 1 --> NAME (Required): The name of the EC2 instance we are checking.
# 2 --> TIMEOUT, in minutes (Optional, default: 5)

NAME=$1
if [[ -z "${NAME}" ]]; then
    echo "No NAME supplied!"
    exit 666
fi
echo "NAME: ${NAME}"

TIMEOUT=$2
if [[ -z "${TIMEOUT}" ]]; then
    echo "No TIMEOUT supplied, so defaulting to 5 minutes."
    TIMEOUT=5
fi
echo "TIMEOUT: ${TIMEOUT} (minutes)"

echo 'IS EC2 READY...?'

echo "Looking for instance: '${NAME}'"

elapsed=0
while [[ elapsed -le TIMEOUT*60 ]]
do
    echo "Elapsed: ${elapsed}s"
    
    reservations_json=$(aws ec2 describe-instances --filter Name=instance-state-code,Values="16")
    # The valid values are: 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped). 

    raw_instance_ids="$(jq --raw-output --arg name "$NAME" '.Reservations[].Instances[] as $instance | $instance.Tags[] | select(.Key=="Name") | .Value==$name | contains(true)? | if true then $instance | .InstanceId else null end' <<< $reservations_json)"

    if [[ -z "${raw_instance_ids}" ]]; then
        echo "Cannot find instance."
        #echo "EC2 IS NOT READY :-("
        #exit 666
    else
        echo "Found!"
        break
    fi

    sleep 5
    elapsed=$((elapsed + 5))

done

set -f
IFS='
'
read -rd '' -a split_instance_ids <<< $raw_instance_ids
unset IFS
count=0
for instance_id in "${split_instance_ids[@]}"; do
  echo "Instance ID: $instance_id"
  count=$((count + 1))
done
set +f
echo "count: ${count}"

if [[ count -gt 1 ]]; then
  echo "Found more than one instance with name: '${NAME}'"
  echo "EC2 IS NOT READY :-("
  exit 666
fi

is_empty() {

    instance_statuses=$1
    
    if [[ -z "$(jq '.InstanceStatuses[]' <<< $instance_statuses)" ]]; then
        return 1
    fi 
    
    return 0

}

is_ec2_ready() {

    instance_statuses=$(aws ec2 describe-instance-status --instance-ids $instance_id)

    is_empty "${instance_statuses}"

    if [[ $1 -eq 1 ]]; then
        return 0
    fi
    
    instance_state=$(jq --raw-output '.InstanceStatuses[].InstanceState.Name' <<< $instance_statuses)
    
    echo "Instance State: '${instance_state}'"
    
    if [[ "$instance_state" != "running" ]]; then
        return 0
    fi
    
    instance_status=$(jq --raw-output '.InstanceStatuses[].InstanceStatus.Details[] | select(.Name=="reachability") | .Status' <<< $instance_statuses)
    
    echo "Instance Status: '${instance_status}'"
    
    system_status=$(jq --raw-output '.InstanceStatuses[].SystemStatus.Details[] | select(.Name=="reachability") | .Status' <<< $instance_statuses)
    
    echo "System Status: '${system_status}'"
    
    if [[ "$instance_status" != "passed" || "$system_status" != "passed" ]]; then
        #echo "EC2 is failing status checks"
        return 0
    fi
    
    return 1

}

while [[ elapsed -le TIMEOUT*60 ]]
do
    echo "elapsed: ${elapsed}s"
    
    is_ec2_ready

    if [[ $? == 1 ]]; then
        break
    fi

    sleep 5
    elapsed=$((elapsed + 5))

done

echo 'EC2 IS READY :-)'

exit 0