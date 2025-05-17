FROM golang:1.23-bullseye AS builder

RUN mkdir /hello-world
COPY ./ /hello-world
WORKDIR /hello-world
RUN go build \
    && chmod 755 hello-world

FROM gcr.io/distroless/base-debian12

COPY --from=builder /hello-world/hello-world /hello-world/hello-world
USER 1001
ENTRYPOINT ["/hello-world/hello-world"]
