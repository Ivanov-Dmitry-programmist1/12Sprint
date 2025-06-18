FROM golang:1.23

WORKDIR /app

COPY . .

RUN go build -o parcel-tracker

CMD ["./parcel-tracker"]
