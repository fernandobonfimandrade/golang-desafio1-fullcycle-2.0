FROM golang:1.6-alpine as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o /codeEducation
FROM scratch
WORKDIR /
COPY --from=builder /codeEducation /codeEducation

ENTRYPOINT [ "/codeEducation" ]