#!/bin/bash

# template build script
LOCALDIR=unipkg
DOCDIR=unipkg
TIPDIR=unipkg
entrypoint=unipkg-cli
command=unipkg

WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" "$HOME/.local/$LOCALDIR"

cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

chmod -R +x "$HOME/.local/$LOCALDIR/"

sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

which $command || echo "INSTALL FAILED!"
