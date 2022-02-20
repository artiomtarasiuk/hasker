.PHONY: format check_format test run stop
.ONESHELL:

check_dirs := hasker

format:
	black $(check_dirs)
	isort $(check_dirs)

check_format:
	black --check $(check_dirs)
	isort --check-only $(check_dirs)

test: check_format
	safety check

# run: build an image and run locally
run:
	docker-compose up -d --build

# stop: stop the app and clean up
stop:
	docker-compose down --rmi local --remove-orphans
