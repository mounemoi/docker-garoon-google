IMAGE_NAME := garoon-google
IMAGE_TAG  := latest

BUILD_LOG  := build.log

IMAGE_NAME_WITH_TAG := $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build
build:
	docker build --rm -t $(IMAGE_NAME_WITH_TAG) . 2>&1 | tee $(BUILD_LOG)

.PHONY: clean
clean:
	docker rmi $(IMAGE_NAME_WITH_TAG)

