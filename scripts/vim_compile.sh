#!/usr/bin/env sh

## Vim compilation script.
## Clones and compiles vim to enable additional features (i.e. python/perl
## interpretation.

## Author: Jonathan Hull (jonathan.hull11@gmail.com)

if [ -z $1 ]; then
    install_dir=/tmp/vim_make/
else
    install_dir=$1
fi

if [ ! -x $install_dir ]; then
	mkdir -p $install_dir
fi

git clone --recurse-submodules https://github.com/vim/vim.git $install_dir
current_dir=`pwd`

cd $install_dir
vim_version=`git tag | tail -n 1 | rev | cut -d. -f 2-3 | rev | cut -dv -f 2`
vim_version=`echo "${vim_version//.}"`

echo $vim_version

./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/$vim_version
make install

# Submodule installation. -- create switch to handle this as extra
# cd ~/.vim/bundle/YouCompleteMe/
# ./install.py --clang-completer --ts-completer

cd $current_dir
#rm -rf $install_dir
