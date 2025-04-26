FROM golang:1.21-alpine

WORKDIR /app

# Copy dependency files first (for better caching)
COPY go.mod go.sum ./

RUN go mod download

# Now copy the rest of the source code
COPY . .

RUN go build -o hello

EXPOSE 8080

CMD ["./hello"]
