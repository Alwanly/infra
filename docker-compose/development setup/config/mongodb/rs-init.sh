#!/bin/bash

mongo <<EOF
var config = {
    "_id": "my-replica-set",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongodb:27017",
            "priority": 2
        },
        {
            "_id": 2,
            "host": "mongodb2:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF