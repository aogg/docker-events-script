FROM docker

RUN apk add --no-cache docker-compose bash

COPY ./docker-scripts/ /docker-scripts/

CMD bash /docker-scripts/docker-entrypoint.sh