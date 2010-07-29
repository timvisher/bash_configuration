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
