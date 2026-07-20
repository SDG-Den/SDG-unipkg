#!/bin/bash

# template install script

### dependencies (for each dependency)

PKG_INDEX=unipkg
LOCALDIR=unipkg
entrypoint=unipkg-cli
command=unipkg

WORKDIR="$HOME/.cache/SDG-PKG/$PKG_INDEX"

cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"


sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

which $command || echo "INSTALL FAILED!"

bash -c ~/.local/$LOCALDIR/unipkg-generate
