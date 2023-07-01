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
    else
      echo "To use the installer with dnf you need to run this script with superuser privileges e.g. 'sudo bash install.sh'"
      exit 1
  fi
else
  echo "Your Package Manager is not supported"
  exit 1
fi

if [ "$exist" == 0 ]; then
  if [ -d "$home/.config/nvim" ]; then
    mv "$home/.config/nvim" "$home/.config/nvimBACKUP"
  fi
  mv ../nvim "$home/.config"
fi
