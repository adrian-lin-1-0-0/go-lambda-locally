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

or

```bash
docker run -p 8080:8080 \
--entrypoint /usr/local/bin/aws-lambda-rie \
local-go-lambda:latest ./main
```

## Test

```bash
curl "http://localhost:8080/2015-03-31/functions/function/invocations" -d '{}'
```
## Ref
- [AWS Lambda Runtime Interface Emulator](https://github.com/aws/aws-lambda-runtime-interface-emulator/)
- [Event Models](https://github.com/aws/aws-lambda-go/tree/main/events)
- [Using AWS Lambda with other services](https://docs.aws.amazon.com/lambda/latest/dg/lambda-services.html)
