FROM docker

COPY ./scripts/ /docker-scripts/

RUN apk add --no-cache docker-compose supervisor

ENTRYPOINT /bin/bash