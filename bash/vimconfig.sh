#!/bin/bash

### This is configuration for .vimrc file

DIR=~/preconfig

if [ ! -d "$DIR" ]; then
  md ~/preconfig
fi

rm -f ~/preconfig/run.sh

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
