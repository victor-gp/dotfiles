#!/bin/bash

if ! command -v code &> /dev/null
then
    echo "vscode not installed?" >&2
    exit 127
fi

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit 1

current_extensions=/tmp/vscode-current-extensions.txt
\code --list-extensions > $current_extensions

extensions_to_install=/tmp/vscode-extensions-to-install.txt
diff --old-line-format="" --unchanged-line-format="" \
    $current_extensions extensions.txt \
    > $extensions_to_install

readarray -t < <(cat $extensions_to_install) extensions_list

if [ ${#extensions_list[@]} -eq 0 ]; then
    echo "No extensions to install."
    exit 0
fi

for extension in "${extensions_list[@]}"; do
    \code --install-extension "$extension"
done
