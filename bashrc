# See following for more information: http://www.infinitered.com/blog/?p=19

if [ -d ~/.bin ]; then
	export PATH=:~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
alias ls='ls -F --color=auto --show-control-chars'

# Misc
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style audible" # no bell

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Git --------------------------------------------------------------
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Prompts ----------------------------------------------------------
export PS1="\n[\[\e[0;32m\]\W\[\e[0m\]]\$ "  # Primary prompt with only a path
export PS2='\[\e[0;32m\]>\[\e[0m\] '    # Secondary prompt
export PS3='\[\e[0;32m\]#?\[\e[0m\] '   # Prompt 3
export PS4='\[\e[0;32m\]+\[\e[0m\] '     # Prompt 4

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

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
export EDITOR='emacs -fg white -bg black -cr white -fh'
