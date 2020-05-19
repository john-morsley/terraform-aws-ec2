#!/bin/bash

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

#echo 'Cloning Shared Scripts repository...'

#git clone https://github.com/john-morsley/shared-scripts.git

bash shared-scripts/aws/is_ec2_ready.sh ${NAME} ${TIMEOUT}

exit 0