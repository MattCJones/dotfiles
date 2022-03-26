#!/bin/bash
# Setup dot files on new machines


# Dot files to symbolically link to $HOME
dotfiles=`find . -maxdepth 1 -not -type d -name '.*'`
vimfiles=`find '.vim' -maxdepth 1 -not -type d -name '*'`

# Link the files
function linkfiles() {
    files=$1
    todir=$2
    filesname=${3:-}
    echo "Linking $filesname files to $todir"
    fromdir=$PWD
    cd $todir
    for file in ${files[@]}; do
        ln -s "$fromdir/$file"
    done
    cd - > /dev/null
}

linkfiles "${dotfiles[@]}" "$HOME" "dot"
linkfiles "${vimfiles[@]}" "$HOME/.vim" "vim"
