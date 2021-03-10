#!/bin/bash

# <configuration>

DOTBOT_VERSION="v1.18.0"

TOPICS=(
    git
    gnome-terminal
    vscode
    zsh
)

# </configuration>

set -eu

dotbot_dir="/tmp/dotbot"
dotbot_bin="$dotbot_dir/bin/dotbot"

if [ ! -d "$dotbot_dir" ]; then
    echo "Checking out Dotbot..." >&2

    git clone --quiet -c advice.detachedHead=false --branch "${DOTBOT_VERSION}" --depth 1 \
        https://github.com/anishathalye/dotbot.git "$dotbot_dir"

    git -C "$dotbot_dir" submodule --quiet update --init --recursive

    echo "Checkout successful" >&2
fi

set +e

for topic in "${TOPICS[@]}"; do
    printf -- '-%.0s' {1..32} ; echo
    echo "Dotbot-installing topic ‘$topic’:"

    "$dotbot_bin" -c "$topic"/install.config.yaml
done
