FROM golang:1.21 as build
WORKDIR /app
COPY go.mod go.sum ./
COPY main.go .
RUN GOOS=linux GOARCH=amd64 go build -o main main.go

FROM public.ecr.aws/lambda/provided:al2023
COPY --from=build /app/main ./main
ENTRYPOINT [ "./main" ]