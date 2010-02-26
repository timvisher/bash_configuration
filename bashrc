# This file is a merge between the 3.7-1 /etc/defaults/etc/skel/ files and [http://www.infinitered.com/blog/?p=19]

# System Environment Variables

# source the system wide bashrc if it exists
if [ -e /etc/bashrc ] ; then
  source /etc/bashrc
fi

# Set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  export PATH=~/bin:$PATH
fi

# MacPorts
if [ -d /opt ] ; then
  export PATH=/opt/local/bin:$PATH
  export MANPATH=/opt/local/man:$MANPATH
  # If this shell is interactive, turn on programmable completion enhancements.
  # Any completions you add in ~/.bash_completion are sourced last.
  case $- in
    *i*) [[ -f /opt/local/etc/bash_completion ]] && . /opt/local/etc/bash_completion ;;
  esac
  alias scr='cd ~; screen -h 50000'
fi

if [ -d /Applications/MacPorts/Emacs.app/Contents/MacOS/bin ] ; then
  export PATH=/Applications/MacPorts/Emacs.app/Contents/MacOS/bin:$PATH
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d ~/share/man ]; then
  export MANPATH=~/share/man:$MANPATH
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

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -FG'

# Ignore duplicate commands in history
export HISTCONTROL="ignoredups"

# Git -------------------------------------------------------------

# Turn on advanced git bash completion if the file exists
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=1

alias g='git'
alias gk='gitk'
alias gka='gitk --all'

# Prompts ----------------------------------------------------------
export PS1='\n[\[\e[0;32m\]\W\[\e[0m\]]$(__git_ps1)\$ '
export PS2='\[\e[0;32m\]>\[\e[0m\] '
export PS3='\[\e[0;32m\]#?\[\e[0m\] '
export PS4='\[\e[0;32m\]+\[\e[0m\] '

# Aliases

# rm Convenience
alias r='rm'
alias rr='rm -r'
alias rrf='rm -rf'

# cp Convenience
alias c='cp'
alias cr='cp -R'

# ls Convenience
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

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

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Editors ----------------------------------------------------------
export EDITOR='emacsclient'
