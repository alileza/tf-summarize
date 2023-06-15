FROM golang:1.20.3-alpine as gobuild

COPY . /app

WORKDIR /app

RUN go build -o tf-summarize

# Use a smaller image for production
FROM alpine:3.17.3

WORKDIR /app

COPY --from=gobuild /app/tf-summarize /usr/bin/tf-summarize

ENTRYPOINT [ "tf-summarize" ]