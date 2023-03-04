NAME = inception

S = srcs/
COMPOSE_FILE = $Sdocker-compose.yml

all: $(NAME)
.PHONY: all

$(NAME):
	@make build
	@make up

build:
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) build
	@echo "\n\033[1;32m*  Containers built  *\033[0m\n"
.PHONY: build

up:
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) up -d
	@echo "\n\033[1;32m*  Containers running  *\033[0m\n"
.PHONY: start

down:
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) down
	@echo "\n\033[1;33m*  Containers down  *\033[0m\n"
.PHONY: stop

restart: down up
.PHONY: restart

status:
	@docker ps
.PHONY: status

network:
	@docker network ls
.PHONY: network

# Stop and remove images
clean:
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) down --rmi all
	@echo "\n\033[1;31m*  Containers down & images erased  *\033[0m\n"
.PHONY: clean

# Remove all containers, volumes & networks
fclean: clean
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@docker compose -p $(NAME) -f $(COMPOSE_FILE) rm -sfv
	@echo "\n\033[1;31m*  Containers data & networks removed  *\033[0m\n"
.PHONY: fclean

re: fclean all
.PHONY: re

debug:
	@printf 'Enter which tool you want to use (logs): '
	@read TOOL && make $$TOOL
.PHONY: debug

logs:
	@printf 'Enter which container to logs from: '
	@read CONTAINER && docker logs $$CONTAINER
.PHONY: logs
