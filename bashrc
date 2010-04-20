#!/bin/bash

# This file is a merge between the 3.7-1 /etc/defaults/etc/skel/ files and [http://www.infinitered.com/blog/?p=19]

# System Environment Variables

if [[ $OS == Windows* ]] ; then
    unset TMP
    unset TEMP
    # Any completions you add in ~/.bash_completion are sourced last.
    case $- in
      *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
    esac
else
    # MacPorts
    if [ -d /opt ] ; then
      # If this shell is interactive, turn on programmable completion enhancements.
      # Any completions you add in ~/.bash_completion are sourced last.
      case $- in
        *i*) [[ -f /opt/local/etc/bash_completion ]] && . /opt/local/etc/bash_completion ;;
      esac
    fi
fi

# Shell Options
# #############

# See man bash for more options...

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Colors
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -FG'

# Ignore duplicate commands in history
export HISTCONTROL="ignoredups"

# Git -------------------------------------------------------------

# Turn on advanced git bash completion if the file exists
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

alias g='git'
alias gk='gitk'
alias gka='gitk --all'

# Prompts ----------------------------------------------------------
# Why won't '\n \[${COLOR_CYAN}\] [ \[${COLOR_YELLOW}\] \W \[${COLOR_CYAN}\] ]$(__git_ps1)\$ \[${COLOR_NC}\]' work?
export PS1='\n\[\e[0;36m\][\[\e[1;33m\]\W\[\e[0;36m\]]\[\e[1;32m\]$(__git_ps1)\[\e[0;36m\]\$ \[\e[0m\]'
export PS2='\[\e[1;33m\]>\[\e[0m\] '
export PS3='\[\e[1;33m\]#?\[\e[0m\] '
export PS4='\[\e[1;33m\]+\[\e[0m\] '

# Aliases

# rm Convenience
alias r='rm'
alias rr='rm -r'
alias rrf='rm -rf'

# cp Convenience
alias c='cp'
alias cr='cp -R'

# ls Convenience
export CLICOLOR=1
if [[ $OS == Windows* ]] ; then
    LS_PREAMBLE='ls --color=auto -F'
    export LS_COLORS="di=36:ex=31:ln=01;31"
else
    LS_PREAMBLE='ls -GF'
fi
alias l='${LS_PREAMBLE}'
alias ll='${LS_PREAMBLE} -hl'
alias la='${LS_PREAMBLE} -A'
alias lla='${LS_PREAMBLE} -lAh'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'

# Misc -------------------------------------------------------------
alias gr='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias df='df -h'
alias scr='cd ~; screen -h 50000 -s /bin/bash'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Editors ----------------------------------------------------------
export EDITOR='emacsclient'
