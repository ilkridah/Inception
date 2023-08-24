SRCS = srcs/docker-compose.yml

up:
	docker-compose -f $(SRCS) up -d

down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top

clean:
	docker-compose -f $(SRCS) down --volumes --remove-orphans

prune: clean
	docker system prune -f --all --volumes

.PHONY: up down ps top clean prune
