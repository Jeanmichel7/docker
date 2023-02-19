name = inception
all:
	printf "Launch configuration ${name}...\n"
	mkdir -p ~/data
	mkdir -p ~/data/www
	mkdir -p ~/data/database
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	printf "Building configuration ${name}...\n"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	printf "Stop configuration ${name}...\n"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

fclean:
	printf "Total clean of all configurations docker\n"
	@if [ -n "$$(docker ps -qa)" ]; then \
        docker stop $$(docker ps -qa); \
    else \
        echo "No running containers to stop."; \
    fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
        docker volume rm $(docker volume ls -q) \
    else \
        echo "No volumes to remove."; \
    fi
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /home/jrasser/data/www/*
	sudo rm -rf /home/jrasser/data/database/*

clean:
	printf "Cleaning configuration ${name}...\n"
	docker system prune -a
	sudo rm -rf /home/jrasser/data/www/*
	sudo rm -rf /home/jrasser/data/database/*

re:	fclean all

.PHONY	: all build down re clean fclean