# See following for more information: http://www.infinitered.com/blog/?p=19

# source the users bashrc if it exists
if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
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
echo -e "`bash --version`"
systeminfo | fgrep -i 'system up time'
echo -ne "Server time is: "; date
echo -e "\nPATH: $PATH"
echo -e "\nMANPATH: $MANPATH"

