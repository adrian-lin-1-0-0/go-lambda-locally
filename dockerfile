FROM public.ecr.aws/lambda/provided:al2 as build
RUN yum install -y golang
ADD go.mod go.sum ./
RUN go mod download

# build
ADD . .
RUN go build -tags lambda.norpc -o /main
FROM public.ecr.aws/lambda/provided:al2
COPY --from=build /main /main
ENTRYPOINT [ "/main" ]
