# This file is a merge between the 3.7-1 /etc/defaults/etc/skel/ files and [http://www.infinitered.com/blog/?p=19]

# System Environment Variables

if [[ $OS == Windows* ]] ; then
    unset TMP
    unset TEMP
    # Any completions you add in ~/.bash_completion are sourced last.
    case $- in
      *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
    esac
    alias scr='cd ~; screen -h 50000 -s /bin/bash'
else
    # MacPorts
    if [ -d /opt ] ; then
      # If this shell is interactive, turn on programmable completion enhancements.
      # Any completions you add in ~/.bash_completion are sourced last.
      case $- in
        *i*) [[ -f /opt/local/etc/bash_completion ]] && . /opt/local/etc/bash_completion ;;
      esac
    fi

    alias scr='cd ~; screen -h 50000'
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
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -FG'

# Ignore duplicate commands in history
export HISTCONTROL="ignoredups"

# Git -------------------------------------------------------------

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
