PRJ_NAME=#
ECR_URI=#
VERSION:=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(PRJ_NAME):$(VERSION) .

push:
	aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin $(ECR_URI)
	docker tag $(PRJ_NAME):$(VERSION) $(ECR_URI)/$(PRJ_NAME):$(VERSION)
	docker tag $(PRJ_NAME):$(VERSION) $(ECR_URI)/$(PRJ_NAME):latest
	docker push $(ECR_URI)/$(PRJ_NAME):$(VERSION)
	docker push $(ECR_URI)/$(PRJ_NAME):latest

deploy:
	aws ecs update-service \
	--cluster [cluster Name] \
	--service [service name] \
	--task-definition [task name : tag version] \
	--force-new-deployment