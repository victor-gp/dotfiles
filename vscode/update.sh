#!/bin/bash

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

# store list of vscode extensions
\code --list-extensions > extensions.txt
