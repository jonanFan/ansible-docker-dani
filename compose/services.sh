#!/bin/bash
if [ "$(docker network ls | grep wordpress_default)" ]; then
    # cleanup
    docker service rm wordpress_wordpress
    docker service rm wordpress_db
    docker-compose -f wordpress.yml down 
    #docker network rm wordpress_default
fi
if [ "$(docker network ls | grep bind_default)" ]; then
    # cleanup
    docker service rm bind_bind
    docker-compose -f bind.yml down
   # docker network rm bind_default
fi
if [ "$(docker network ls | grep ejabberd_default)" ]; then
    # cleanup
    docker service rm ejabberd_ejabberd
    docker-compose -f ejabberd/docker-compose.yml down
    docker network rm ejabberd_default
fi

echo "Completed" > /tmp/clusterrm
