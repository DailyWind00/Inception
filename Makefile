all:
	@mkdir -p /home/mgallais/data/mysql /home/mgallais/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build;

up:
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean:
	@containers=$$(docker ps -qa);                      \
	if [ -n "$$containers" ]; then                       \
		docker rm -f $$containers;                        \
	fi;                                                    \
	volumes=$$(docker volume ls -q);                        \
	if [ -n "$$volumes" ]; then                              \
		docker volume rm -f $$volumes;                        \
	fi;                                                        \
	docker network prune -f;                                    \
	docker image prune -f;                					     \
	echo "sudo is required only because of the data folder path"; \
	sudo rm -rf /home/mgallais/data/mysql /home/mgallais/data/wordpress

re: fclean all

.PHONY: all up down fclean re