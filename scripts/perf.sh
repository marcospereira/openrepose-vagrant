#!/usr/bin/env bash

for i in `seq 1 10`
do
    echo "-------------------------------------------"
    echo "Running round #$i:"
    wrk -c 10 -t 4 -d10s -H 'x-pp-user: someuser' http://127.0.0.1:8881/people.json
done
