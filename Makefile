BUILD_PATH	=	/home/rozhou/

all:
	mkdir -p $(BUILD_PATH)db
	mkdir -p $(BUILD_PATH)wp
	docker-compose -f srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
	rm -rf $(BUILD_PATH)

re: stop all

.PHONY: fclean all clean free stop build re reset
