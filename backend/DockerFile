# ---- Build stage ----
    FROM golang:1.21-alpine AS builder
    WORKDIR /app
     
    # Copy module files first so this layer is cached unless deps change
    COPY go.* ./
    RUN go mod download
     
    COPY . .
    RUN CGO_ENABLED=0 GOOS=linux go build -o backend .
     
    # ---- Run stage ----
    FROM alpine:3.19
    RUN apk add --no-cache ca-certificates
    WORKDIR /app
    COPY --from=builder /app/backend .
     
    EXPOSE 9000
    ENTRYPOINT ["./backend"]