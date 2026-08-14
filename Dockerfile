FROM alpine:3.23

# Install only what we need
RUN apk add --no-cache \
    bash \
    git \
    curl \
    rsync \
    gettext \
    docker-cli \
    docker-cli-buildx \
    docker-cli-compose \
    ca-certificates \
    nodejs \
    npm

# Create non-root user (recommended)
# RUN addgroup -S deploy && adduser -S deploy -G deploy

WORKDIR /workspace
# USER deploy

ENTRYPOINT ["/bin/bash"]
