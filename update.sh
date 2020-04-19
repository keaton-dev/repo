#!/bin/bash

dpkg-scanpackages -m debs /dev/null > Packages

gzip -cf Packages > Packages.gz
bzip2 -cf Packages > Packages.bz2
xz -cf Packages > Packages.xz
xz -cf --format=lzma Packages > Packages.lzma

echo "Enter commit message:"
read COMMIT
git add .
git commit -m "$COMMIT"
git push
