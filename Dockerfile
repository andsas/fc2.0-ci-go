FROM golang:alpine3.16 as builder
WORKDIR /app
COPY . .
RUN go build -o /app math.go
FROM scratch
COPY --from=builder /app/math /app
CMD ["/app"]