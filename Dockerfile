FROM golang:1.12.8-alpine3.10
LABEL maintainer="wormazabal <www.zeke.cl>"
LABEL version="1.0"
LABEL project="Web-GO-Backend-Test"
LABEL description="Imagen Docker para pruebas Go"
RUN mkdir /app
ADD . /app
WORKDIR /app
EXPOSE 3000/tcp
RUN apk add curl git vim wget
RUN go get -u github.com/swaggo/swag/cmd/swag
RUN go get -u github.com/swaggo/echo-swagger
RUN go get -u github.com/alecthomas/template
RUN go get -u github.com/labstack/echo
RUN go get -u github.com/labstack/echo/middleware
RUN go build -o main .
CMD ["/app/main"]