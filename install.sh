#!/bin/bash

set -eu

DOTBOT_VERSION="v1.18.0"
DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

echo "Checking Dotbot out..." >&2
git clone --quiet https://github.com/anishathalye/dotbot.git "$DOTBOT_DIR"
git -C "$DOTBOT_DIR" checkout --quiet "tags/${DOTBOT_VERSION}"
git -C "$DOTBOT_DIR" submodule --quiet update --init --recursive
echo "Checkout successful" >&2

"${DOTBOT_DIR}/${DOTBOT_BIN}" -c vscode/install.config.yaml
