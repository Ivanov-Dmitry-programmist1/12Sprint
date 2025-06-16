# Этап сборки
FROM golang:1.23.4-alpine AS builder

WORKDIR /app

# Установим зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем остальной код
COPY . .

# Сборка бинарника
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Финальный образ
FROM alpine:latest

WORKDIR /app

# Копируем бинарник
COPY --from=builder /app/main .


COPY --from=builder /app/tracker.db .

CMD ["./main"]
