docker_build:
    @docker build \
        --build-arg WORK_DIR=/var/www/dev/ \
        -t docker.io/codereviewvideos/symfony.dev .

docker_push:
    @docker push docker.io/codereviewvideos/symfony.dev

bp: docker_build docker_push

dev:
    @docker-compose down && \
        docker-compose build --pull --no-cache && \
        docker-compose \
            -f docker-compose.yml \
        up -d --remove-orphans
