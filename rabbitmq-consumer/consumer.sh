#!/bin/bash
/usr/bin/amqp-consume --url=$BROKER_URL -q foo -c 1 cat
