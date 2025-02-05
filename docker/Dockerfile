# syntax=docker/dockerfile:1

FROM alpine:latest

RUN apk update && apk add --no-cache rsync sshpass openssh

COPY ./script/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]