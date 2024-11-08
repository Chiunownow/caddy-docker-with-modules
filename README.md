# Caddy with Custom Plugins

This repository automates the building and publishing of a Caddy Docker image with additional plugins. GitHub Actions are used to monitor new Caddy releases and push updated images to GitHub Container Registry (GHCR).

## Features

- **Automated Builds**: Triggers image builds automatically when a new Caddy release is detected.
- **Custom Plugins**: Add or remove plugins by modifying the Dockerfile.
- **Versioned Tags**: Images are tagged with `latest` and the specific Caddy release version (e.g., `v2.4.6`), providing flexibility in deployment.

## Customizing Plugins

To customize the plugins included in the Caddy image:

1. **Fork this repository** to your own GitHub account.
2. **Modify the `Dockerfile`** by editing the `RUN xcaddy build` section. Add or remove plugins as needed, like in the example below:
   ```dockerfile
   RUN xcaddy build \
       --with github.com/mholt/caddy-webdav \
       --with github.com/caddy-dns/cloudflare
