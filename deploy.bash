#!/bin/bash

if [ -f ~/.bashrc ] ; then
  mv ~/.bashrc ~/.bashrc.bak
fi

if [ -f ~/.bash_profile ] ; then
  mv ~/.bash_profile ~/.bash_profile.bak
fi

if [ ! -f $PWD/bashrc ] ; then
  echo "I need to be run from within the project directory."
  exit
fi

ln -s $PWD/bashrc ~/.bashrc

if [ ! -f $PWD/bash_profile ] ; then
  echo "I need to be run from within the project directory."
  exit
fi

ln -s $PWD/bash_profile ~/.bash_profile
