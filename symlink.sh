#!/bin/bash
# Symlinks dotfiles into home directory

dir=`pwd`
if [[ $dir != "${HOME}/dotfiles" ]]; then
  echo "Run this from ~/dotfiles, please" >&2
  exit 1
fi
for file in .* bin; do
    if [[ "$file" == ".git" || "$file" == "." || "$file" == ".." ]]; then
        continue
    fi
    source="$dir/$file"
    dest="$HOME/$file"
    if [ -e "$dest" ]; then
        # And the file isn't already a symlink to our expected file
        if [ ! -h "$dest" ]; then
            mv "$dest" "$dest".orig
        else
            echo "$dest already symlinked"
            continue
        fi
    fi
    ln -sfvn "$source" "$dest"
done
