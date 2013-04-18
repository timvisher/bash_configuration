#!/usr/bin/env bash
set -eux

BASH_CONF_HOME=${0%/*}
DOT_FILES=$BASH_CONF_HOME/dotfiles/*
BIN_FILES=$BASH_CONF_HOME/bin/*

cd $BASH_CONF_HOME

for df in $DOT_FILES
do
  df_basename=${df##*/}
  if [ -f ~/".$df_basename" ]
  then
    echo mv ~/".$df_basename" ~/"bak.$df_basename"
  fi
  ln -sf "$PWD/${df#./}" ~/".$df_basename"
  # source $df
done

for bf in $BIN_FILES
do
  bf_basename=${bf##*/}
  if [ -f ~/"bin/$bf_basename" ]
  then
    mv ~/"bin/$bf_basename" ~/"bin/bak.$bf_basename"
  fi
  ln -sf "$PWD/${bf#./}" ~/"bin/$bf_basename"
done

echo Don\'t forget to add ~/bin to your PATH!
