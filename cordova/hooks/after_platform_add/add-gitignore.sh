#!/bin/bash

BASEDIR=$1

for d in "$BASEDIR/platforms/"*
do
  cp ".gitignore" "$d/.gitignore"
done
