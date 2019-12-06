#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# Activate vi mode in bash.
# To check all key bindings type 'bind -P'
set -o vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

################################################################################

export EDITOR="nvim"
export TERMINAL="xfce4-terminal"
export BROWSER="chromium"
export READER="zathura"
export FILE="vifm"

# Man pages locale priority
export MANOPT="-L ru"

# Man pages pager and location in percentage
export MANPAGER="less -s -M +Gg"

# fzf search include hidden files and ignore .git
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

# Specify the path to the askpass helper program.
# Check SUDO(8) for more information
export SUDO_ASKPASS="/usr/bin/ssh-askpass"

export FONTCONFIG_PATH="/etc/fonts"
export TERM="screen-256color"

# Color promt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# less syntax highlighting
# source-highlight package required
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# Add `~/.local/bin/` and all subdirs to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
#export PATH="$PATH:$HOME/MyTetra/"

################################################################################

# Enable color support of ls and also add handy aliases
alias ls='ls --color=auto --group-directories-first -p -hN'
alias dir='dir --color=auto --group-directories-first -p -hN'
alias vdir='vdir --color=auto --group-directories-first -p -hN'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# Git Aliases
alias gs='git status'
alias gl='git log --all --graph --decorate --oneline'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'

# Custom Aliases
alias install='sudo apt install'
alias purge='sudo apt purge'
alias show='sudo apt show -a'
alias kon='sudo service kerio-kvc start'
alias koff='sudo service kerio-kvc stop'
alias figlet='figlet -d ${HOME}/.local/share/figlet'

# Others
alias pb='p-builder.sh'
alias pf='cd ${HOME}/Documents/Projects/riceraw'

################################################################################

# Use neovim for vim if present.
# command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

################################################################################

# Bash auto completion. Required package bash-completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# A command-line fuzzy finder
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] &&
 		source /usr/share/doc/fzf/examples/key-bindings.bash

# Shows Linux System Information with Distribution Logo.
# Configuration file .config/neofetch/config.conf
neofetch




