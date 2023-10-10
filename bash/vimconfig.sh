#!/bin/bash

### This is configuration for .vimrc file

cat << EOF | sudo tee -a ~/.vimrc

set history=200
set paste
set wrap
set number

map \t :ter

EOF
