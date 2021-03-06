fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt EXTENDED_HISTORY # add timestamps to history
setopt COMPLETE_IN_WORD

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY # add history incrementally, whatever that means
# Spara inte efterföljande dubletter i historiken
setopt HIST_IGNORE_DUPS
# Spara inte kommandorader som börjar med ett mellanslag i historiken
setopt HIST_IGNORE_SPACE

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

# Fin prompt
autoload -U promptinit
promptinit
prompt zefram
# TODO: användare/root och hosts i olika färger

# Några tecken ska inte behandlas som om de ingick i ord
#export WORDCHARS=${WORDCHARS//[=\/&;<>]}
autoload select-word-style
select-word-style bash

# emacs bindings
bindkey -e

bindkey '^[[3~' delete-char
#bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
# Tabba bakåt mellan förslag med skift+tab
bindkey '^[[Z' reverse-menu-complete

# http://zsh.sourceforge.net/FAQ/zshfaq04.html#l50
setopt AUTO_LIST
unsetopt LIST_AMBIGUOUS

# Ctrl+arrowkeys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
