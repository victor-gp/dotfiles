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

dotbot_dir="dotbot"
dotbot_bin="bin/dotbot"

echo "Checking Dotbot out..." >&2

[ -d "$dotbot_dir" ] ||
    git clone --quiet https://github.com/anishathalye/dotbot.git "$dotbot_dir"

git -C "$dotbot_dir" checkout --quiet tags/"${DOTBOT_VERSION}"
git -C "$dotbot_dir" submodule --quiet update --init --recursive

echo "Checkout successful" >&2

set +e

for topic in "${TOPICS[@]}"; do
    printf -- '-%.0s' {1..32} ; echo
    echo "Dotbot-installing topic ‘$topic’:"

    "${dotbot_dir}/${dotbot_bin}" -c "$topic"/install.config.yaml
done
