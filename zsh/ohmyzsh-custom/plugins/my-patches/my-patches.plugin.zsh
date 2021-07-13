### adapting other plugins ###

### for zsh-syntax-highlighting

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=yellow
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow
ZSH_HIGHLIGHT_STYLES[redirection]=fg=yellow
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[globbing]=fg=cyan
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=cyan
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[autodirectory]=none
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[path]=none

ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=none
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=none
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=none
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=none
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=none
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=bold

typeset -A ZSH_HIGHLIGHT_PATTERNS
# do not disturb on the first token
ZSH_HIGHLIGHT_PATTERNS+=('(#s)[ ]#[a-zA-Z0-9_]##(#e)' 'bg=black')
# caution when "$ rm -rf"
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'fg=white,bold,bg=red')
