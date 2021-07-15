#!/bin/bash

NAME=$1
VERSION=$2
TAP=$3
WARNING="Error parameter, pls use it in this way 'sh install_specific_version_formula.sh formula version tap[defaut is homebrew/cask]'"
if [ -z $NAME ] || [ -z $VERSION ];
then
    echo $WARNING
    exit
fi
if [ -z $TAP ];
then
    TAP="homebrew/cask"
fi
FORMULA="${NAME}@${VERSION}"
brew extract --force --version=${VERSION} ${NAME} ${TAP}
echo "\033[1mFinding ${FORMULA}"
re=`brew search ${NAME} | grep ${FORMULA}`
if [ ! $re ]; then
echo "\033[1mI can't find ${FORMULA}"
else
echo "\033[1mI find it!!!"
brew install ${NAME}@${VERSION}
fi
