all:
	cd srcs && docker compose up -d
clear:
	cd srcs && docker compose down
re: clear all