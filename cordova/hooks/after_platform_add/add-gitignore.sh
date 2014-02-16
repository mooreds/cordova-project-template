#!/bin/bash

BASEDIR=$1

for d in "$BASEDIR/platforms/"*
do
  cp "$BASEDIR/hooks/after_platform_add/.gitignore" "$d/.gitignore"
done
