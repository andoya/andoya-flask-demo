#!/bin/bash

ANDOYA_BUILD_DIR=".andoya-build"
ANDOYA_PKG_NAME="andoya-lambda-package.zip"

if [ -d $ANDOYA_BUILD_DIR ]; then
    rm -rf $ANDOYA_BUILD_DIR
fi

if [ -f $ANDOYA_PKG_NAME ]; then
    rm -rf $ANDOYA_PKG_NAME
fi

mkdir $ANDOYA_BUILD_DIR

cp -r $(poetry env info --path)/lib/python3.8/site-packages/* $ANDOYA_BUILD_DIR
cp -r $(poetry env info --path)/src/andoya-wsgi/andoyawsgi $ANDOYA_BUILD_DIR
cp -r andoyaflaskdemo $ANDOYA_BUILD_DIR
cd $ANDOYA_BUILD_DIR
zip -r9 $OLDPWD/$ANDOYA_PKG_NAME . --exclude=*.egg-link* --exclude=*.dist-info* --exclude=*__pycache__* --exclude=*.git*
cd $OLDPWD
