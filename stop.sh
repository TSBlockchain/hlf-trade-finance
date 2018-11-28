docker-compose -f docker-compose.yml down

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

docker ps -a


