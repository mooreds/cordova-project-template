#!/bin/bash

for d in "../../../platforms/"*
do
  cp ".gitignore" "$d/.gitignore"
done
