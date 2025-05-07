# Stage 1: Build the Go app
FROM golang:1.22.2 AS builder

WORKDIR /app

# Copy source code and go.mod/go.sum if present
COPY . .

# Build the binary
RUN go build -o app .

# Stage 2: Create a minimal final image
FROM debian:bookworm-slim

WORKDIR /app

# Copy binary from builder
COPY --from=builder /app/app .

# Expose port
EXPOSE 8080

# Command to run the executable
CMD ["./app"]
