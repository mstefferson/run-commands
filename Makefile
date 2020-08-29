.PHONY: build

IMAGE=dev

build:
	docker build -t $(IMAGE) .

run: build
	docker run -it $(IMAGE) bash
