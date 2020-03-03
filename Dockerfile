FROM alpine:3.11.3

ARG GRPCURL_VERSION=1.4.0

RUN \
  apk add \
  --no-cache \
  ca-certificates \
  curl \
  git

RUN mkdir -p /tmp/installing

WORKDIR /tmp/installing

RUN \
  curl -L -o grpcurl.tar.gz \
  "https://github.com/fullstorydev/grpcurl/releases/download/v${GRPCURL_VERSION}/grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz" && \
  tar xzf grpcurl.tar.gz && \
  mv grpcurl /usr/bin

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

CMD echo "Hello World"
