FROM golang:1.21-alpine

WORKDIR /app
COPY main.go .
RUN go build -o hello

EXPOSE 8080
CMD ["./hello"]
