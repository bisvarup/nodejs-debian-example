#!/bin/bash

LOCAL_DIR=deb
PACKAGE="my-awesome-project"

# remove folder if present
[ -d $LOCAL_DIR ] && rm - rf $LOCAL_DIR

# create the folders in the fake root folder
mkdir $LOCAL_DIR
mkdir -p $LOCAL_DIR/opt/$PACKAGE/files

# copy all the files to the correct folders
cp -r build-debian-file/* $LOCAL_DIR/
cp -r dist/* $LOCAL_DIR/opt/$PACKAGE/files
cp scripts/start.sh $LOCAL_DIR/opt/$PACKAGE/

# apply proper permissions
chmod 755 $LOCAL_DIR/DEBIAN/postrm
chmod 755 $LOCAL_DIR/DEBIAN/prerm

# build the debian project
PACKAGE_NAME=$PACKAGE"_1.0-1.deb"
dpkg-deb --build $LOCAL_DIR $PACKAGE_NAME

# cleanup
rm -rf $LOCAL_DIR

