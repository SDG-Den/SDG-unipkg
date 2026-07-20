#!/bin/bash

# template update script

PKG_INDEX=unipkg
LOCALDIR=unipkg
DOCDIR=unipkg
TIPDIR=unipkg
entrypoint=unipkg-cli
command=unipkg



WORKDIR="$HOME/.cache/SDG-PKG/$PKG_INDEX"

rm -rf "$HOME/.local/$LOCALDIR"
cp -r "$WORKDIR/local/"* "$HOME/.local/"

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" 
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command
