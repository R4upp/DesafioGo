FROM golang:1.18 AS builder

WORKDIR /go/app

COPY *.go/ ./

RUN go build hello-world.go

FROM scratch
WORKDIR app/
COPY --from=builder /go/app .
ENTRYPOINT ["./hello-world"]