FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY . .
RUN go mod init app
RUN go build

FROM scratch

COPY --from=builder /usr/src/app .
CMD ["./app"]