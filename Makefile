hello:
	@echo "Hello! use other targets!"

docker-build:
	docker-compose up -d

docker-kill:
	docker-compose stop
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)

docker-restart:
	docker-compose stop
	docker-compose build
	docker-compose up -d

docker-start:
	docker-compose build
	docker-compose up -d
