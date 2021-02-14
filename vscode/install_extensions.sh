#!/bin/bash

current_extensions=/tmp/current-vscode-extensions.txt
extensions_to_install=/tmp/current-vscode-extensions-to-install.txt

\code --list-extensions > $current_extensions

diff --old-line-format="" --unchanged-line-format="" \
    $current_extensions extensions.txt \
    > $extensions_to_install

readarray -t < <(cat $extensions_to_install) extensions_list

if [ ${#extensions_list[@]} -eq 0 ]; then
    echo "No extensions to install."
    exit 0
fi

for extension in "${extensions_list[@]}"; do
    code --install-extension "$extension"
done
