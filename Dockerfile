FROM caddy:builder-alpine AS builder

# Install necessary tools
RUN apk add --no-cache curl jq wget

# Get the latest version of xcaddy
RUN LATEST_VERSION=$(curl -s https://api.github.com/repos/caddyserver/xcaddy/releases/latest | jq -r .tag_name | sed 's/^v//') \
    && echo "Latest version is $LATEST_VERSION"

# Download and install xcaddy
RUN wget https://github.com/caddyserver/xcaddy/releases/download/v${LATEST_VERSION}/xcaddy_${LATEST_VERSION}_linux_amd64.tar.gz -O /tmp/xcaddy.tar.gz \
    && tar -xzf /tmp/xcaddy.tar.gz -C /usr/bin \
    && rm /tmp/xcaddy.tar.gz

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/caddy-dns/cloudflare

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy