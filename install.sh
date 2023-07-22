#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dotfile in $(find ${DOTFILES_DIR} -type f -name '\.*' -exec basename \{} \;); do
  src="${DOTFILES_DIR}/${dotfile}"
  dest="${HOME}/${dotfile}"

  if [ ! -L "${dest}" ]; then
    if [ -e "${dest}" ]; then
      echo "[ERR ${dest} exists but it's not a symlink. Please fix that manually" && continue
    else
      ln -s "${src}" "${dest}"
      echo "[OK] ln ${src} -> ${dest}"
    fi
  else
    echo "[WRN] ${src} already symlinked"
  fi
done
