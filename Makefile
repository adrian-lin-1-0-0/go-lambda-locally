.PHONY: build-image
build-image:
	docker build --platform linux/amd64 -t local-go-lambda:latest .

.PHONY: run-image
run-image:
	docker run -p 8080:8080 \
	--entrypoint /usr/local/bin/aws-lambda-rie \
	local-go-lambda:latest ./main