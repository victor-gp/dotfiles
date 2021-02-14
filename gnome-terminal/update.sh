#!/bin/bash

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

# save gnome-terminal preferences
dconf dump /org/gnome/terminal/ > preferences.dconf
