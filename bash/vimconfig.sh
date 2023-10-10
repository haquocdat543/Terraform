#!/bin/bash

### This is configuration for .vimrc file

if [ ! -f ~/preconfig/run.sh ]
then
	md ~/preconfig/run.sh
fi

if [ ! -f ~/preconfig/.vimrc ]
then
	md ~/preconfig/.vimrc
fi

cat << EOF | sudo tee ~/preconfig/run.sh

rm -f ~/preconfig/previmrc
mv ~/.vimrc ~/preconfig/previmrc
mv ~/preconfig/.vimrc ~/.vimrc

EOF

cat << EOF | sudo tee ~/preconfig/.vimrc

set history=200
set paste
set wrap
set number

map \t :ter

EOF
