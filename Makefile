development:
	docker-compose up --build

production:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build