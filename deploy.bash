#!/usr/bin/env bash
set -eux

BASH_CONF_HOME=${0%/*}
DOT_FILES=$BASH_CONF_HOME/dotfiles/*
BIN_FILES=$BASH_CONF_HOME/bin/*

for df in $DOT_FILES
do
  df_basename=${df##*/}
  if [ -f ~/.$df_basename ]
  then
    mv ~/.$df_basename ~/.$df_basename.bak
  fi
  ln -s $df ~/.$df_basename
  # source $df
done

for bf in $BIN_FILES
do
  bf_basename=${bf##*/}
  if [ -f ~/bin/$bf_basename ]
  then
    mv ~/bin/$bf_basename ~/bin/$bf_basename.bak
  fi
  ln -s $bf ~/bin/$bf_basename
done

echo Don\'t forget to add ~/bin to your PATH!
