#!/bin/bash

# build python3
# https://stackoverflow.com/questions/30444890/vim-use-python3-interpreter-in-python-mode/30449124#30449124
# https://vi.stackexchange.com/questions/18433/installing-or-building-vim-with-python3-support-for-python-3-7-x-on-linux
# https://stackoverflow.com/questions/26437837/vim-configure-for-python3-support-but-still-shows-python3-in-version-informat

# sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
#     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#     libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#     ruby-dev mercurial

pushd vim90

make distclean

./configure \
    --with-compiledby="Akiicat" \
    --with-features=huge \
    --with-python3-command=python3.8 \
    --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --enable-rubyinterp=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-cscope=yes \
    --enable-terminal=yes \
    --prefix=$HOME/.local

make

src/vim --version

popd
