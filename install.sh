#!/bin/bash

home=$HOME
echo "██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗"
echo "██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║"
echo "██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║"
echo "██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║"
echo "╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║"
echo " ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝"

exist=1
if command -v yay &> /dev/null; then
  yay -S --noconfirm neovim
  exist=0
elif command -v brew &> /dev/null; then
  brew install neovim
  exist=0
elif command -v dnf &> /dev/null; then
  if [ "$(id -u)" == 0 ]; then
    dnf install neovim
    exist=0
    else
      echo "To use the installer with dnf you need to run this script with superuser privileges e.g. 'sudo bash install.sh'"
      exit 1
  fi
else
  echo "Download the appimage if you are using Linux from the Release page of neovim and put it somewhere in your path."
  echo "Nvim will not work until you installed it"
  exist=0
fi

if [ "$exist" == 0 ]; then
  if [ -d "$home/.config/nvim" ]; then
    mv "$home/.config/nvim" "$home/.config/nvimBACKUP"
  fi
  mv ../nvim "$home/.config"
fi
