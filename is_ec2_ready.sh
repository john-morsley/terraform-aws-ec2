﻿#!/bin/sh

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

NAME=$1
if [[ -z "${NAME}" ]]; then
    echo "No NAME supplied!"
    exit 666
fi
echo "NAME: ${NAME}"

echo 'IS EC2 READY...?'

#aws ec2 describe-instances | jq .
reservations_json=$(aws ec2 describe-instances)

instance_id=$(jq --raw-output --arg name "$NAME" '.Reservations[].Instances[] as $instance | $instance.Tags[] | select(.Key=="Name") | .Value==$name | contains(true)? | if true then $instance | .InstanceId else null end' <<< $reservations_json)
echo "Instance ID: ${instance_id}"

#aws ec2 describe-instance-status --instance-ids $instance_id

is_empty() {

    #echo "is_empty?"

    instance_statuses=$1
    
    #echo $instance_statuses
    
    if [[ -z "$(jq '.InstanceStatuses[]' <<< $instance_statuses)" ]]; then
        #echo "Yes"
        return 1
    fi 
    
    #echo "No"
    return 0

}

is_ec2_ready() {

    instance_statuses=$(aws ec2 describe-instance-status --instance-ids $instance_id)

    #echo $instance_statuses | jq [.]

    is_empty "${instance_statuses}"

    #echo "is_empty:$1"

    if [[ $1 -eq 1 ]]; then
        return 0
    fi
    
    instance_state=$(jq --raw-output '.InstanceStatuses[].InstanceState.Name' <<< $instance_statuses)
    
    echo "Instance State: '${instance_state}'"
    
    if [[ "$instance_state" != "running" ]]; then
        #echo "EC2 is not running"
        return 0
    fi
    
    #echo "EC2 is 'running'"
    
    instance_status=$(jq --raw-output '.InstanceStatuses[].InstanceStatus.Details[] | select(.Name=="reachability") | .Status' <<< $instance_statuses)
    
    echo "Instance Status: '${instance_status}'"
    
    system_status=$(jq --raw-output '.InstanceStatuses[].SystemStatus.Details[] | select(.Name=="reachability") | .Status' <<< $instance_statuses)
    
    echo "System Status: '${system_status}'"
    
    if [[ "$instance_status" != "passed" || "$system_status" != "passed" ]]; then
        #echo "EC2 is failing status checks"
        return 0
    fi
    
    #echo "EC2 is passing status checks"
    return 1

}

while true
do
    
    is_ec2_ready

    if [[ $? == 1 ]]; then
        break
    fi

    sleep 5

done

echo 'EC2 IS READY :-)'

exit 0