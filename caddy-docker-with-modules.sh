#!/bin/sh

# Execute caddy list-modules and find the line "Non-standard modules: ", then extract the number of modules and trim spaces
non_standard_modules=$(caddy list-modules | grep "Non-standard modules: " | sed 's/Non-standard modules: //' | sed 's/^ *//' | sed 's/ *$//')

# Check if the extracted number of modules is 0
if [ "$non_standard_modules" -eq 0 ]; then
  # Number of modules is 0, need to install plugins and run Caddy
  echo -e "\n\e[34mcaddy is new, installing packages...\e[0m\n"
  caddy add-package github.com/caddy-dns/cloudflare github.com/mholt/caddy-webdav && caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
else
  # Number of modules is not 0, directly run Caddy
  echo -e "\n\e[34mpackages already installed, running caddy...\e[0m\n"
  caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
fi