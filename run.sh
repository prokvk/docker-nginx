#!/usr/bin/env sh

exec docker run --rm --name $NGINX_IMAGE -p 80:80 \
	-v $CONFDIR:/etc/nginx \
	-v $DATADIR:/data \
	$DOCKER_CMD
