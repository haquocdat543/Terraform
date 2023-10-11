#!/bin/bash
### This is use for command dall 

### This is configuration for .vimrc file

## Delete .vimrc and .bashrc in root folder 
rm -f ~/.vimrc
rm -f ~/.bashrc

## Restore backup files
mv ~/preconfig/backup/.vimrc.backup ~/.vimrc
mv ~/preconfig/backup/.bashrc.backup ~/.bashrc

rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

## Clear all alias
exec bash

