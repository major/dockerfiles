#!/bin/bash
cat <<"EOF"
******************************************************************************
     _    _                        _
 ___| | _| |_   _ __ ___  __ _  __| |_   _
/ __| |/ / __| | '__/ _ \/ _` |/ _` | | | |
\__ \   <| |_  | | |  __/ (_| | (_| | |_| |
|___/_|\_\\__| |_|  \___|\__,_|\__,_|\__, |
                                     |___/
******************************************************************************
EOF

while true; do

    # Tell Kube/OpenShift that we're ready
    touch /opt/skt/ready.txt

    # Consume the message queue
    echo ">> Waiting for new jobs from ${BROKER_URL}..."
    CMDLINE=$(/usr/bin/amqp-consume --url=$BROKER_URL -q foo -c 1 cat)

    # Run the command that was sent
    echo ">> Running command: ${CMDLINE}"
    $CMDLINE
    RETCODE=$?

    # Clean up afterwards
    echo ">> Cleaning up"
    rm -rf /opt/skt/*

done
