
PLATFORM ?= linux/amd64,linux/arm64

build:
	$(MAKE) mc
	$(MAKE) minio

mc:
	docker buildx build --push --platform=$(PLATFORM) \
		--tag=tangx/mc 	\
		--file=mc.Dockerfile .

minio:
	docker buildx build --push --platform=$(PLATFORM) \
		--tag tangx/minio \
		--file=minio.Dockerfile .

