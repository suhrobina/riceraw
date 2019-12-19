#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#

### FUNCTIONS =================================================================

# Shorter version of a common command that it used herein.
_checkexec() {
	command -v "$1" > /dev/null
}

# Enter directory and list contents
cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls -pvA --color=auto --group-directories-first
	else
		builtin cd ~ && ls -pvA --color=auto --group-directories-first
	fi
}

### GENERAL ===================================================================

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

### VARIABLE ##################################################################

# Default terminal
export TERMINAL="xfce4-terminal"

# Default editor
if _checkexec gvim; then
	export VISUAL="gvim"
	export EDITOR="vim"
else
	export VISUAL="vim"
	export EDITOR=$VISUAL
fi

# Default browser
export BROWSER="chromium"

# Default reader
export READER="zathura"

# Default file manager
export FILE="vifm"

# Man pages locale priority
export MANOPT="-L ru"

# Default pager. Show location as a percentage in pager
export PAGER="less -s -M +Gg"
export MANPAGER="$PAGER"

# fzf search include hidden files and ignore .git
# Required fdfind package
if _checkexec fdfind; then
    export FZF_DEFAULT_COMMAND='fdfind --hidden --follow --exclude ".git" .'
    export FZF_CTRL_T_COMMAND='fdfind --hidden --follow --exclude ".git" .'
fi

# Specify the path to the askpass helper program.
# Check SUDO(8) for more information
export SUDO_ASKPASS="/usr/bin/ssh-askpass"

export FONTCONFIG_PATH="/etc/fonts"
export TERM="screen-256color"

# Bash prompt
if [ -n "$SSH_CONNECTION" ]; then
    # bash prompt for ssh
	export PS1="\w \$ "
else
    export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi
export PS2="> "

# Colourise less/man
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

# Include scripts in the PATH
if [ -d "$HOME/.local/bin/scripts" ]; then
    export PATH=$PATH:"$HOME"/.local/bin/scripts
    # export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
fi

# Enable tab completion when starting a command with 'sudo'
[ "$PS1" ] && complete -cf sudo

### ALIASES ###################################################################

# Make ls a bit easier to read and enable color
# support of ls and also add handy aliases
alias ls='ls -pv --color=auto --group-directories-first'
alias lsa='ls -pvA --color=auto --group-directories-first'
alias lsl='ls -lhpv --color=auto --group-directories-first'
alias lsla='ls -lhpvA --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# Git
if _checkexec git; then
    alias gs='git status'
    alias gl='git log --all --graph --decorate --oneline'
    alias ga='git add'
    alias gb='git branch'
    alias gc='git commit'
    alias gd='git diff'
    alias go='git checkout'
fi

# APT
if _checkexec apt; then
    alias install='sudo apt install'
    alias purge='sudo apt purge'
    alias show='sudo apt show -a'
fi

# Safer default for cp, mv, rm.  These will print a verbose output of
# the operations.  If an existing file is affected, they will ask for
# confirmation.  This can make things a bit more cumbersome, but is a
# generally safer option.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

# Others
if _checkexec vim; then
    alias v='vim'
    alias vi='vim'
fi

alias figlet='figlet -d ${HOME}/.local/share/figlet'
alias pb='p-builder.sh'
alias pf='cd ${HOME}/Documents/Projects/riceraw'
alias kon='sudo service kerio-kvc start'
alias koff='sudo service kerio-kvc stop'

### OTHER #####################################################################

# set the colours of the various files and directories that are shown with the
# ls(1) command. Use the command dircolors –print-database to display a list
# of the filetypes and what colour codes will be used for each one.
if _checkexec dircolors; then
	dircolors_data="$HOME/.local/share/dircolors"
	test -r $dircolors_data && eval "$(dircolors -b ${dircolors_data})" || eval "$(dircolors -b)"
fi

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




