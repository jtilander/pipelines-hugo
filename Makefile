IMAGENAME?=jtilander/pipelines-hugo
TAG?=test

.PHONY: image push clean run debug

image:
	docker build -t $(IMAGENAME):$(TAG) .
	docker images $(IMAGENAME):$(TAG)

push: image
	docker push $(IMAGENAME):$(TAG)

clean:
	docker rmi `docker images -q $(IMAGENAME):$(TAG)`

run:
	docker run --rm -it $(IMAGENAME):$(TAG) bash
