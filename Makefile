COMMON_NAME = nginx

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
PORTS = \
	-p 80:80 \
	-p 8080:8080
	# -p 443:443
VOLUMES = \
	-v $$PWD/config:/etc/nginx \
	-v $$PWD/data:/data

.PHONY: build run stop inspect rm logs ports up

build:
		docker build -t $(IMAGE) stable/alpine

run:
		docker run -d $(NET) --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)
		# docker run --rm -it $(NET) --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) sh

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)

up:
		rsync -avz ./* /home/prokvk/dev/forpsi/docker-nginx --exclude data