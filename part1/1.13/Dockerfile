FROM golang:1.16-alpine

EXPOSE 8080

WORKDIR /app

COPY . ./

RUN go build

CMD ["./server"]