VERSION=10.0.2

build:
	docker buildx build \
		--push \
		--platform linux/amd64,linux/arm64 \
		--build-arg version=${VERSION} \
		-t ghcr.io/ternaustralia/graphdb:${VERSION} \
		.
