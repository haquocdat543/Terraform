#!/bin/bash

### This is configuration for .vimrc file

if [ ! -d ~/preconfig ]
then
	mkdir ~/preconfig
fi

if [ -f ~/preconfig/run.sh ]
then
	rm ~/preconfig/run.sh
fi

if [ -f ~/preconfig/.vimrc ]
then
	rm ~/preconfig/.vimrc
fi

cat << EOF | sudo tee -a ~/preconfig/run.sh


if [ -f ~/preconfig/previmrc ]
then
	rm ~/preconfig/previmrc
fi
mv ~/.vimrc ~/preconfig/previmrc
mv ~/preconfig/.vimrc ~/.vimrc

EOF

cat << EOF | sudo tee -a ~/preconfig/.vimrc

set history=200
set paste
set wrap
set nonumber

map \t :ter

EOF
