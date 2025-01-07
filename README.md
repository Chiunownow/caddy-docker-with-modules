# README

## Overview

A script to run Caddy in Docker and install additional plugins if needed.

## Usage

1. **Command Line:**

    ```sh
    docker run ...parameters... caddy /config/caddy-docker-with-modules.sh
    ```

2. **Unraid:**

    Open Advanced View, add `/config/caddy-docker-with-modules.sh` to Post Arguments.

## Script Details

- Checks for non-standard Caddy modules.
- Installs what modules you need if no non-standard modules are found.
- Runs Caddy with the specified configuration.