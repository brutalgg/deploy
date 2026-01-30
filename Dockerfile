FROM alpine:3.19

# Install only what we need
RUN apk add --no-cache \
    bash \
    git \
    rsync \
    docker-cli \
    docker-cli-compose \
    ca-certificates

# Create non-root user (recommended)
RUN addgroup -S deploy && adduser -S deploy -G deploy

WORKDIR /workspace
USER deploy

ENTRYPOINT ["/bin/bash"]
