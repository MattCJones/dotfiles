#!/bin/bash
# Setup dot files on new machines

# Dot files to symbolically link to $HOME
dotfiles=`find . -maxdepth 1 -not -type d -name '.*'`
vimfiles=`find '.vim' -maxdepth 1 -not -type d -name '*'`
ipyfiles=`find '.ipython/profile_matt' -maxdepth 1 -not -type d -name '*'`

# Link the files
function linkfiles() {
    files=$1
    todir=$2
    filesname=${3:-}
    echo "Linking $filesname files to $todir"
    fromdir=$PWD
    mkdir -p $todir
    cd $todir
    for file in ${files[@]}; do
        ln -s "$fromdir/$file"
    done
    cd - > /dev/null
}

linkfiles "${dotfiles[@]}" "$HOME" "dot"
linkfiles "${vimfiles[@]}" "$HOME/.vim" "vim"
linkfiles "${ipyfiles[@]}" "$HOME/.ipython/profile_matt" "ipy"

# Copy Windows Terminal settings
wintermdir=/mnt/c/Users/weehi/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/
cp Windows/WindowsTerminal/settings.json $wintermdir/
