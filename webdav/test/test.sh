#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker-compose -f ${SCRIPT_DIR}/docker-compose.yaml up -d

sleep 1
RESULT=$(curl --digest --user 'testuser:pass' 'http://localhost:8080/testuser/hello.txt')

docker-compose -f ${SCRIPT_DIR}/docker-compose.yaml down

if [ "$RESULT" = "Hello World!" ]; then
    exit 0
else
    exit 1
fi
