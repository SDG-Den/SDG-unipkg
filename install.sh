#!/bin/bash

# template install script
LOCALDIR=unipkg
DOCDIR=unipkg
TIPDIR=unipkg
entrypoint=unipkg-cli
command=unipkg

WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

clear

echo "Welcome to the unipkg installer."
echo "Scripts will be placed in ~/.local/$LOCALDIR"
echo "Config will be placed in ~/.config/unipkg"
echo ""

if command -v sudo > /dev/null && command -v bash > /dev/null && command -v fzf > /dev/null ; then
    echo "dependency check passed"
else
    echo "dependency check failed, please ensure fzf, sudo and bash are installed"
    exit 1
fi

echo ""
echo "there are two pre-set configurations for managers available, stable and dev"
echo "stable contains only human-written, human-verified configurations"
echo "dev contains configurations that were made by using AI to pull from the official documentation"
echo ""
echo "please choose which file you want to use, do note that dev does offer broader support"
choice=""

while [[ "$choice" != "stable" && "$choice" != "dev" ]]; do
    read -p "Choose an option (stable/dev): " choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')
    if [[ "$choice" != "stable" && "$choice" != "dev" ]]; then
        echo "Invalid choice. Please enter 'stable' or 'dev'."
    fi
done

echo "installing scripts"
rm -rf ~/.local/$LOCALDIR
mkdir -p ~/.local/$LOCALDIR
cp -r "$WORKDIR/local/"* ~/.local/

echo "making scripts executable"
chmod -R +x ~/.local/$LOCALDIR/

echo "linking to /usr/bin"
sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

echo "installing configuration"
rm -rf ~/.config/unipkg
mkdir -p ~/.config/unipkg

if [ "$choice" == "dev" ]; then
    echo "installing dev managers.csv"
    cp "$WORKDIR/config/unipkg/managers-dev.csv" ~/.config/unipkg/managers.csv
    cp "$WORKDIR/config/unipkg/unipkg.conf" ~/.config/unipkg/unipkg.conf
fi

if [ "$choice" == "stable" ]; then
    echo "installing stable managers.csv"
    cp "$WORKDIR/config/unipkg/managers-stable.csv" ~/.config/unipkg/managers.csv
    cp "$WORKDIR/config/unipkg/unipkg.conf" ~/.config/unipkg/unipkg.conf
fi

echo "installing documentation"
mkdir -p ~/.local/docs/$DOCDIR
cp -r "$WORKDIR/docs/"* ~/.local/docs/

echo "installing tips"
mkdir -p ~/.local/tips/$TIPDIR
cp -r "$WORKDIR/tips/"* ~/.local/tips/
