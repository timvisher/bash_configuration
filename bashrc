# See following for more information: http://www.infinitered.com/blog/?p=19

if [ -d ~/.bin ]; then
	export PATH=~/.bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -F --color=auto --show-control-chars'

# Misc
export HISTCONTROL=ignoredups

# bash completion settings (actually, these are readline settings)
bind "set bell-style audible" # no bell

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

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

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'

# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Misc
alias g='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Editors ----------------------------------------------------------
export EDITOR='emacs'
