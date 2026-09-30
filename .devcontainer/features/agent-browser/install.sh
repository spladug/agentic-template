#!/usr/bin/env bash
set -euo pipefail

# Browser launch flags live in devcontainer-feature.json's containerEnv:
# no sandbox inside the container, and SwiftShader for WebGL without a GPU.

# Headless Chromium for agent-browser. Installed from Debian at build time
# because the runtime firewall blocks the Chrome-for-Testing download that
# `agent-browser install` would attempt.
apt-get update
apt-get install -y --no-install-recommends \
  chromium \
  fonts-liberation \
  fonts-noto-color-emoji
apt-get clean
rm -rf /var/lib/apt/lists/*

# The npm package bundles the native binaries, so nothing is fetched at
# runtime. Install into /usr/local so it's on PATH for every user.
npm install -g --prefix /usr/local "agent-browser@${VERSION:-latest}"
