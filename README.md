# Deploy Container

A minimal Alpine-based container that has just what's needed to deploy Docker
containers and stacks. It saves the step of installing the same tooling every
time a deploy job runs on a generic build runner.

Published to GitHub Container Registry: `ghcr.io/brutalgg/deploy`

## What's included

Built on `alpine:3.23` with:

- `bash` — shell for deploy scripts
- `git` — clone/checkout sources
- `curl` — reachability checks and API calls
- `rsync` — copy artifacts to remotes
- `gettext` — `envsubst` for templating config files
- `docker-cli` + `docker-cli-buildx` + `docker-cli-compose` — drive Docker / Compose
  deploys and build images with BuildKit
- `ca-certificates` — TLS roots
- `nodejs` + `npm` — run Node-based tooling

## Usage

Pull a pinned version (recommended) or `latest`:

```sh
docker pull ghcr.io/brutalgg/deploy:v0.3.0
docker pull ghcr.io/brutalgg/deploy:latest
```

Run a deploy script against the host Docker daemon:

```sh
docker run --rm \
  -v "$PWD:/workspace" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/brutalgg/deploy:v0.3.0 \
  -c "docker compose up -d"
```

The default entrypoint is `/bin/bash` and the working directory is `/workspace`.

## Versioning

This image follows [Semantic Versioning](https://semver.org/) with a `v`
prefix: `vMAJOR.MINOR.PATCH`.

- **MAJOR** — incompatible changes (e.g. base image bump that drops/changes tools)
- **MINOR** — backwards-compatible additions (e.g. a new tool added)
- **PATCH** — backwards-compatible fixes (e.g. pinned tool/version fixes)

While on `0.x`, the contents may still change between minor releases as the tool
set settles. Pre-release builds use a hyphenated suffix (e.g. `v1.0.0-rc.1`).

## Releases

Images are built and pushed automatically by the
[publish workflow](.github/workflows/docker_image_publish.yml) whenever a
GitHub Release is published. Each release publishes two tags:

- `ghcr.io/brutalgg/deploy:<release-tag>`
- `ghcr.io/brutalgg/deploy:latest`
