#!/bin/bash

vscode_path="$(which code)"
vscode() { "$vscode_path" "$@"; }
alias code='cd code'

# revert unwanted default set by OMZ
unset LESS

alias ls='ls --color=tty --group-directories-first'

# prompt before removing files
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
setopt rmstarsilent # disable zsh's version of rm -I

# don't clear scrollback/history
alias clear='clear -x'

# colorize man pages
export MANPAGER="sh -c 'col -bx | bat --no-config -p --language=man'"
