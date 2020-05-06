FROM docker

COPY ./scripts/ /docker-scripts/

RUN apk add --no-cache docker-compose

ENTRYPOINT /bin/bash