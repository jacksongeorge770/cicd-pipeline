# Use official Go image as base
FROM golang:1.22.2
# Set working directory inside container
WORKDIR /app

# Copy go source code into container
COPY main.go .

# Build the Go app
RUN go build -o app .

# Expose port
EXPOSE 8080

# Command to run the executable
CMD ["./app"]