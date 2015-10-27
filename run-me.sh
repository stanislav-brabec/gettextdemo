#!/bin/bash

set -o errexit
PREFIX=$PWD/RUNTEST
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}
export LD_LIBRARY_PATH=$PREFIX/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export PATH=$PREFIX/bin${PATH:+:$PATH}
tar -jxf ../libgettextdemo-0.1.tar.bz2
cd libgettextdemo-0.1
./configure --prefix=$PREFIX --includedir=$PREFIX/include --libdir=$PREFIX/lib --datadir=$PREFIX/share
make install
cd ..
touch README
touch NEWS
touch AUTHORS
touch ChangeLog
#gettextize --force
./autogen.sh --no-configure
mv po/Makevars.template po/Makevars
cd m4
touch ChangeLog
echo "EXTRA_DIST =" *.m4 >Makefile.am
cd ..
./autogen.sh --prefix=$PREFIX --includedir=$PREFIX/include --libdir=$PREFIX/lib --datadir=$PREFIX/share
make
make install
# This updates po files (useful before release).
cd po
make update-po
cd ..
# Tarball QA (useful before release).
make distcheck
# test is not installed, but we need installed locales to test them:
LANG=cs_CZ.UTF-8 gettextdemo
