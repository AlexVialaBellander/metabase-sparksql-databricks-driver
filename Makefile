VERSION := $(shell cat VERSION)

build:
	docker build --build-arg METABASE_VERSION=v$(VERSION) -t metabase:v$(VERSION)-databricks -f Dockerfile .

release:
	docker tag metabase:v$(VERSION)-databricks alexviala/metabase:$(VERSION)-databricks
	docker push alexviala/metabase:$(VERSION)-databricks
