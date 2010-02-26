#!/bin/bash

if [ -f ~/.bashrc ] ; then
  mv ~/.bashrc ~/.bashrc.bak
fi

if [ -f ~/.bash_profile ] ; then
  mv ~/.bash_profile ~/.bash_profile.bak
fi

if [ -f bashrc ] ; then
  ln -s $1/bashrc ~/.bashrc
fi

if [ -f bash_profile ] ; then
  ln -s $1/bash_profile ~/.bash_profile
fi
