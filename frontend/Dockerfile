FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum* ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /frontend .

FROM alpine:3.19

WORKDIR /app
COPY --from=builder /frontend .
COPY --from=builder /app/static ./static
COPY --from=builder /app/templates ./templates

EXPOSE 8080
ENTRYPOINT ["./frontend"]