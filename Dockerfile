FROM rust:1 as builder
WORKDIR /app
ADD . /app

RUN CARGO_HTTP_MULTIPLEXING=false cargo build --release

FROM debian:12.9-slim
COPY --from=builder /app/target/release/myapp /app
EXPOSE 8080
CMD ["/app"]