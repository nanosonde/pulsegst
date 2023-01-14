default_target: local

COMMIT_HASH := $(shell git log -1 --pretty=format:"%h"|tail -1)
VERSION = 1.0.0
IMAGE_REPO ?= ghcr.io/nanosonde/pulsegst
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

version:
	echo 'VERSION = "$(VERSION)-$(COMMIT_HASH)"' > pulsegst/version.py

local:
	docker buildx build --tag pulsegst:latest .

amd64:
	docker buildx build --platform linux/amd64 --tag $(IMAGE_REPO):$(VERSION)-$(COMMIT_HASH) .

arm64:
	docker buildx build --platform linux/arm64 --tag $(IMAGE_REPO):$(VERSION)-$(COMMIT_HASH) .

#armv7:
#	docker buildx build --platform linux/arm/v7 --tag $(IMAGE_REPO):$(VERSION)-$(COMMIT_HASH) --load .

build: version amd64 arm64
#	docker buildx build --platform linux/arm/v7,linux/arm64,linux/amd64 --tag $(IMAGE_REPO):$(VERSION)-$(COMMIT_HASH) .
	docker buildx build --platform linux/arm64,linux/amd64 --tag $(IMAGE_REPO):$(VERSION)-$(COMMIT_HASH) .

push: build
#	docker buildx build --push --platform linux/arm/v7,linux/arm64,linux/amd64 --tag $(IMAGE_REPO):$(GITHUB_REF_NAME)-$(COMMIT_HASH) .
	docker buildx build --push --platform linux/arm64,linux/amd64 --tag $(IMAGE_REPO):$(GITHUB_REF_NAME)-$(COMMIT_HASH) .

prune_build_cache:
	docker builder prune

.PHONY:
