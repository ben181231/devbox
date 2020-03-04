FROM alpine:3.11.3

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
  curl -L -o caddy \
  "https://github.com/caddyserver/caddy/releases/download/v2.0.0-beta.15/caddy2_beta15_linux_arm64" && \
  chmod +x caddy && \
  mv caddy /usr/bin && \
  \
  cd / && \
  rm -rf /tmp/installing

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

CMD echo "Hello World"
