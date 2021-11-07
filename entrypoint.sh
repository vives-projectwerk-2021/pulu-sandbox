#!/bin/sh
echo "Starting Pulu Sandbox..."

wrapdocker > /dev/null 2>&1 &
sleep 5

while (! docker version ); do
    echo "Waiting for Docker to launch..."
    sleep 1
    wrapdocker > /dev/null 2>&1 &
done

sleep 5

if [ -d "/deployment" ]; then
    cd deployment
    sh startup.sh | cat
    docker-compose logs -f
else
    git clone git@github.com:vives-projectwerk-2021/server-deployment.git deployment | cat
    cp /pulu.env /deployment/production/.env
    cd deployment
    echo $@ >> startup.sh
    $@ | cat
    sleep 1
fi