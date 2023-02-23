NAME = inception

S = srcs
.INTERMEDIATE: 	$S/mariadb/Dockerfile \
				$S/nginx/Dockerfile \
				$S/wordpress/Dockerfile

all: $(NAME)
.PHONY: all

$(NAME):
	@make build

build:
	@cd $S && docker compose build
.PHONY: build

up:
	@cd $S && docker compose up -d
.PHONY: start

down:
	@cd $S && docker compose down
.PHONY: stop

restart: down up
.PHONY: restart

clean:
	@rm -rf $S/wordpress/wp-content

fclean: clean down
	@cd $S && docker compose rm -f
.PHONY: fclean

re: fclean all
.PHONY: re