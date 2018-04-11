#!/bin/bash -x
cat <<"EOF"
******************************************************************************
     _    _                        _
 ___| | _| |_   _ __ ___  __ _  __| |_   _
/ __| |/ / __| | '__/ _ \/ _` |/ _` | | | |
\__ \   <| |_  | | |  __/ (_| | (_| | |_| |
|___/_|\_\\__| |_|  \___|\__,_|\__,_|\__, |
                                     |___/
******************************************************************************
Consuming work from:

    ${BROKER_URL}

EOF

# Consume the message queue
CMDLINE=$(/usr/bin/amqp-consume --url=$BROKER_URL -q foo -c 1 cat)

# Run the command that was sent
$CMDLINE
RETCODE=$?

# Sleep for 5 seconds after the work is complete
sleep 5
exit $RETCODE
