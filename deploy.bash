#!/bin/bash

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

if [ -f ~/.bash_profile ]; then
    rm ~/.bash_profile
fi

if [ -f ~/.inputrc ]; then
    rm ~/.inputrc
fi

cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile
cp inputrc ~/.inputrc
