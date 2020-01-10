FROM golang:1.13-alpine AS build

COPY go.mod src/
COPY *.go src/

RUN cd src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /bin/hello

FROM golang:1.13-alpine

COPY --from=build /bin/hello /bin/hello

ENTRYPOINT [ "/bin/hello" ]