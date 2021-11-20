# install script for this nvim on arch linux (NOT on windows)
import os
os.system("yay -S --noconfirm neovim-git nvim-packer-git")
if os.path.isdir("~/.config/nvim"):
    os.system("mv ~/.config/nvim ~/.config/nvimBACKUP")
os.system("mv ../nvim/ ~/.config/")
