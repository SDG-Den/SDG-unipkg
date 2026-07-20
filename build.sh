#!/bin/bash

# template build script

LOCALDIR=unipkg
DOCDIR=unipkg
TIPDIR=unipkg
entrypoint=unipkg-cli.sh
command=unipkg

WORKDIR=$(pwd)

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" "$HOME/.local/$LOCALDIR"

# todo: only update config if no config exists yet.
cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"


sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

which $command || echo "INSTALL FAILED!"