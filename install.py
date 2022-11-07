# install script for this nvim on arch linux (NOT on windows)
import os
import subprocess
from sys import platform

home = os.path.expanduser("~")
print(
    "██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗",
    "██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
    "██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║",
    "██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
    " ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
)
if (platform == "darwin"):
    exist = subprocess.call('command -v brew>> /dev/null', shell=True)
    if exist == 0:
        print("Installing neovim via homebrew")
        os.system("brew install neovim")
        print("Installing packer via git")
        os.system(
            "git clone --depth 1 https: // github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
        )
    else:
        print("You need to install homebrew on your system: https://brew.sh/")
elif (platform == "linux"):
    exist = subprocess.call('command -v yay>> /dev/null', shell=True)
    if exist == 0:
        os.system("yay -R --noconfirm neovim")
        os.system("yay -S --noconfirm neovim-git nvim-packer-git")
    else:
        print("Your arch system needs yay as your packet manager.")
else:
    print("OS is not supported")
if os.path.isdir(home + "/.config/nvim"):
    os.system("mv " + home + "/.config/nvim " + home + "/.config/nvimBACKUP")
os.system("mv ../nvim " + home + "/.config")
print(
    "You need to run :PackerSync inside nvim to compile your Packer packages")
