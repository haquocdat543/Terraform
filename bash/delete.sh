#!/bin/bash
### This is use for command dall 

### This is configuration for .vimrc file

## all file and folder in of vim configuration and .bashrc file

## Restore backup files
mv ~/preconfig/backup/.vimrc.backup ~/.vimrc
mv ~/preconfig/backup/.bashrc.backup ~/.bashrc

rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

## Clear all alias
exec bash

