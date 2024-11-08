# Caddy Docker Container with Custom Plugins

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

-----

# 带有自定义插件的 Caddy Docker 镜像

本仓库自动构建和发布带有自定义插件的 Caddy Docker 镜像。我们使用 GitHub Actions 监控新的 Caddy 版本，并将更新的镜像推送到 GitHub Container Registry (GHCR)。

## 功能

- **自动构建**：当检测到新的 Caddy 版本时，自动触发镜像构建。
- **自定义插件**：可以通过修改 Dockerfile 添加或删除插件。
- **版本化标签**：镜像使用 `latest` 和特定的 Caddy 版本标签（如 `v2.4.6`），提供灵活的部署选项。

## 自定义插件

要自定义 Caddy 镜像中包含的插件：

1. **Fork 本仓库**到您的 GitHub 账号。
2. **修改 `Dockerfile`** 中的 `RUN xcaddy build` 段落，根据需要添加或移除插件，例如：
   ```dockerfile
   RUN xcaddy build \
       --with github.com/mholt/caddy-webdav \
       --with github.com/caddy-dns/cloudflare
