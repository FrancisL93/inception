NAME = inception

S = srcs

all: $(NAME)
.PHONY: all

$(NAME):
	@make build
	@make up

build:
	@cd $S && docker-compose build
.PHONY: build

up:
	@cd $S && docker-compose up -d
.PHONY: start

down:
	@cd $S && docker-compose down
.PHONY: stop

restart: down up
.PHONY: restart

clean:
.PHONY: clean

fclean: clean down
	@cd $S && docker compose rm -f
.PHONY: fclean

re: fclean all
.PHONY: re