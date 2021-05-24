### Step 1
FROM golang:1.16.4 AS builder

WORKDIR /app

COPY go.mod .
COPY main.go .

RUN GOOS=linux go build -o app .

### Step 2
FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]
