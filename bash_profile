#!/bin/bash

# See following for more information: http://www.infinitered.com/blog/?p=19

# System Environment Variables

# source the system wide bashrc if it exists
if [[ $OS == Windows* ]] ; then
    if [ -e /etc/bash.bashrc ] ; then
      source /etc/bash.bashrc
    fi
else
    if [ -e /etc/bashrc ] ; then
      source /etc/bashrc
    fi
fi

source ~/.bashrc

# Set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  export PATH=~/bin:$PATH
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d ~/share/man ]; then
  MANPATH=~/share/man:$MANPATH
fi

# Set INFOPATH so it includes users' private info if it exists
if [ -d ~/info ] ; then
  INFOPATH=~/share/info:$INFOPATH
fi

# MacPorts
if [ -d /opt/local ] ; then
    export PATH=/opt/local/bin:$PATH
    export MANPATH=/opt/local/man:$MANPATH
fi

# Emacs
if [[ $OS == Windows* ]] ; then
    if [ -d ~/bin/emacs/bin ] ; then
      export PATH=~/bin/emacs/bin:$PATH
    fi
else
    if [ -d /Applications/MacPorts/Emacs.app/Contents/MacOS/bin ] ; then
      export PATH=/Applications/MacPorts/Emacs.app/Contents/MacOS/bin:$PATH
    fi
fi

# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
#     bashrc
#     .bashrc

# Hello Messsage
echo -e "Kernel Information: " `uname -smr`
echo -e "${COLOR_BROWN}`bash --version`${COLOR_NC}"
if [[ $OS == Windows* ]] ; then
    echo "Windoze"
else
    echo -ne "Uptime: "; uptime
fi
echo -ne "Server time is: `date`${COLOR_CYAN}"
echo -e "\n\nPATH: $PATH"
echo -e "\nMANPATH: $MANPATH"
echo -e "\nAliases:"; alias
echo -e "${COLOR_NC}";
