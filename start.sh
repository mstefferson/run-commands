#!/bin/bash
shopt -s dotglob
for filename in *; do
  echo $filename
  ln -s `pwd`/$filename $HOME/$filename
done
rm -r $HOME/.git
rm $HOME/start.sh
