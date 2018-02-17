development:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build

production:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build