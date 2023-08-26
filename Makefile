SRCS	=	srcs/docker-compose.yml

all:	up

up:
	mkdir -p /Users/ilkridah/Desktop/Inception/data/mariadb
	mkdir -p /Users/ilkridah/Desktop/Inception/data/wordpress
	docker-compose -f $(SRCS) up --build -d
down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top
clean:
	docker-compose -f $(SRCS) down --rmi all -v
fclean:
	docker-compose -f $(SRCS) down --rmi all -v
	rm -rf /Users/ilkridah/Desktop/Inception/data/

prune:	fclean
	docker system prune -f --all --volumes
