#!/bin/bash
# Compile Vim with my desired settings.

# Python3 support requires the Debian package "libpython3-dev"
# sudo apt install libpython3-dev

instdir=$HOME/software/vim

mkdir -p $instdir
cd $instdir

git clone git@github.com:vim/vim.git .

make clean
make distclean

# Option 1:
# ./configure --enable-python3interp  --with-python3-command=/usr/bin/python3.8 | tee myconfigure.log
# make 2>&1 | tee mymake.log

# Option 2:
# Add the following line to `src/Makefile`:
# CONF_OPT_PYTHON3 = --enable-python3interp --with-python3-command=/usr/bin/python3.8
make reconfig | tee myconfiguremake.log

sudo make install

echo
echo "Check if Pythyon is enabled (expecting '+python3'):"
vim --version | grep "\+python3"
