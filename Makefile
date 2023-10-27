build: image
	docker run -v $$PWD:/book -w /book spicy-course mdbook build

image: Dockerfile
	docker build -t spicy-course .
