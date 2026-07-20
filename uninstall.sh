#!/bin/bash

# template uninstall script
LOCALDIR=unipkg
DOCDIR=unipkg
TIPDIR=unipkg
command=unipkg

rm -rf $HOME/.local/$LOCALDIR
rm -rf $HOME/.local/docs/$DOCDIR
rm -rf $HOME/.local/tips/$TIPDIR
sudo unlink /usr/bin/$command
