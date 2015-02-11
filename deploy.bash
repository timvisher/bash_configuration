#!/usr/bin/env bash
set -eu

BASH_CONF_HOME=${0%/*}

shopt -s extglob
DOT_FILES=$BASH_CONF_HOME/dotfiles/!(*~)
BIN_FILES=$BASH_CONF_HOME/bin/*

cd $BASH_CONF_HOME

function link_points_here () {
  # echo $1 $2
  if [ -e $1 -a ! -L $1 ]
  then
    echo "# $1 does not appear to be a symlink"
    return -1
  fi

  if [ ! -e $2 ]
  then
    echo "# $2 does not appear to exist"
    return -1
  fi

  [[ $(readlink $1) == $2 ]]
}

function mv_to_timestamp_bak () {
  if [ ! -e $1 ]
  then
    return 0
  fi
  backup_name="$(dirname $1)/bak-$(date +%s).$(basename $1)"
  echo "# Saving $1 off to $backup_name"
  mv $1 $backup_name
}

for df in $DOT_FILES
do
  df_basename=${df##*/}
  if ! link_points_here ~/".$df_basename" "$PWD/${df#./}"
  then
    mv_to_timestamp_bak ~/".$df_basename"
  fi

  if [ ! -e ~/".$df_basename" ]
  then
    ln -s $PWD/${df#./} ~/".$df_basename"
  fi
  # source $df
done

if ! link_points_here ~/bin $PWD/bin
then
  mv_to_timestamp_bak ~/bin
fi

if [ ! -e ~/bin ]
then
  ln -s $PWD/bin ~/bin
fi

if [[ ! $PATH == *$HOME/bin* ]]
then
  echo Don\'t forget to add ~/bin to your PATH!
fi
