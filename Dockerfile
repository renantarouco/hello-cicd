FROM golang:alpine

COPY go.mod src/
COPY *.go src/

RUN cd src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o hello

ENTRYPOINT [ "src/hello" ]