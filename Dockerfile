FROM golang:1.14-alpine AS builder

WORKDIR /go

COPY main.go .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o coderocks main.go

FROM scratch

COPY --from=builder /go/coderocks /go/bin/

ENTRYPOINT [ "/go/bin/coderocks" ]
