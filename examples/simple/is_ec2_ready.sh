#!/bin/sh






# Requires:
# 1 - AWS CLI
# 2 - jq

echo 'IS EC2 READY...?'

aws ec2 describe-instances

is_ec2_ready() {

    state=$(aws ec2 describe-instance-status)

    echo $state

}

#while true
#do
    
#    is_ec2_ready

#    if [[ $? == 1 ]]; then
#        break
#    fi

#    sleep 5

#done

echo 'EC2 IS READY :-)'

exit 0