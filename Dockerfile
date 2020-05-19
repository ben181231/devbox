FROM alpine:3.11.3

ARG CADDY_VERSION=2.0.0
ARG GRPCURL_VERSION=1.4.0

RUN \
  apk add \
  --no-cache \
  ca-certificates \
  curl \
  git

RUN \
  mkdir -p /tmp/installing && \
  cd /tmp/installing && \
  \
  curl -L -o grpcurl.tar.gz \
  "https://github.com/fullstorydev/grpcurl/releases/download/v${GRPCURL_VERSION}/grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz" && \
  tar xzf grpcurl.tar.gz && \
  mv grpcurl /usr/bin && \
  \
  curl -L -o caddy.tar.gz \
  "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz" && \
  tar xzf caddy.tar.gz && \
  mv caddy /usr/bin && \
  \
  cd / && \
  rm -rf /tmp/installing

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

CMD echo "Hello World"
