# This file is a merge between the 3.7-1 /etc/defaults/etc/skel/ files and [http://www.infinitered.com/blog/?p=19]

# System Environment Variables

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# Set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  export PATH=~/bin:$PATH
fi

if [ -d ~/bin/emacs/bin ] ; then
  export PATH=~/bin/emacs/bin:$PATH
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d ~/share/man ]; then
  MANPATH=~/share/man:$MANPATH
fi

# Set INFOPATH so it includes users' private info if it exists
if [ -d ~/info ]; then
  INFOPATH=~/share/info:$INFOPATH
fi

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
case $- in
  *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
esac

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -F --color=auto --show-control-chars'

# Ignore duplicate commands in history
export HISTCONTROL="ignoredups"

# Git -------------------------------------------------------------

# Turn on advanced git bash completion if the file exists
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=1

# Prompts ----------------------------------------------------------
export PS1='\n[\[\e[0;32m\]\W\[\e[0m\]]$(__git_ps1)\$ '
export PS2='\[\e[0;32m\]>\[\e[0m\] '
export PS3='\[\e[0;32m\]#?\[\e[0m\] '
export PS4='\[\e[0;32m\]+\[\e[0m\] '

# Aliases

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'

# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Misc -------------------------------------------------------------
alias g='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'
alias bscr='cd ~; screen -h 1000000 -s /bin/bash'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Editors ----------------------------------------------------------
export EDITOR='emacs'
