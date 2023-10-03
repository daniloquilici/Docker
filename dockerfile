FROM golang:alpine as builder

WORKDIR /app

COPY *.go ./

RUN go build -ldflags '-s -w' main.go

FROM scratch
WORKDIR /
COPY --from=builder /app /
EXPOSE 8080

CMD ["./main"]