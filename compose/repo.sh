#!/bin/bash
if [ ! "$(docker ps -q -f name=registry)" ]; then
    # cleanup
    docker service rm registry

    docker service create --name registry --publish 5000:5000 registry:2
fi
