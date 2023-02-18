name = inception
all:
	printf "Launch configuration ${name}...\n"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	printf "Building configuration ${name}...\n"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

fclean:
	printf "Total clean of all configurations docker\n"
	@if [ -n "$$(docker ps -qa)" ]; then \
        docker stop $$(docker ps -qa); \
    else \
        echo "No running containers to stop."; \
    fi
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /data/www/*
	sudo rm -rf /data/database/*

clean:
	printf "Cleaning configuration ${name}...\n"
	docker system prune -a
	sudo rm -rf /data/www/*
	sudo rm -rf /data/database/*

re:	fclean
	printf "Rebuild configuration ${name}...\n"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

.PHONY	: all build down re clean fclean