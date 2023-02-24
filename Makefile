NAME = inception

S = srcs/
COMPOSE_FILE = $Sdocker-compose.yml

all: $(NAME)
.PHONY: all

$(NAME):
	@make build
	@make up

build:
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) build
	@echo "\n\e[1;32m*  Containers built  *\e[0m\n"
.PHONY: build

up:
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) up -d
	@echo "\n\e[1;32m*  Containers running  *\e[0m\n"
.PHONY: start

down:
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) down
	@echo "\n\e[1;33m*  Containers down  *\e[0m\n"
.PHONY: stop

restart: down up
.PHONY: restart

# Stop and remove images
clean:
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) down --rmi all
	@echo "\n\e[1;31m*  Containers down & images erased  *\e[0m\n"
.PHONY: clean

# Remove all containers, volumes & networks
fclean: clean
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@docker-compose -p $(NAME) -f $(COMPOSE_FILE) rm -sfv
	@echo "\n\e[1;31m*  Containers data & networks removed  *\e[0m\n"
.PHONY: fclean

re: fclean all
.PHONY: re