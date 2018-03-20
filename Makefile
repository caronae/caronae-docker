build:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml build

development:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

production:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build

database:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up postgres
