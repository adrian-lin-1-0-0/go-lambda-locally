# Local go lambda

## Build Docker image

```bash
make build-image
```

or 

```bash
docker build --platform linux/amd64 -t local-go-lambda:latest .
```

## Run Docker image

```bash
make run-image
```

```bash
docker run -p 8080:8080 \
--entrypoint /usr/local/bin/aws-lambda-rie \
local-go-lambda:latest ./main
```

## Test

```bash
curl "http://localhost:8080/2015-03-31/functions/function/invocations" -d '{}'
```