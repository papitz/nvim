# (Deprecated) install script for this nvim on arch linux (NOT on windows)
import os, subprocess

home = os.path.expanduser("~")
print(
    "██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗",
    "██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
    "██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║",
    "██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
    " ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
)

exist = subprocess.call("command -v yay>> /dev/null", shell=True)
if exist == 0:
    os.system("yay -S --noconfirm neovim")
elif exist != 0:
    exist = subprocess.call("command -v brew>> /dev/null", shell=True)
    if exist == 0:
        os.system("brew install neovim")
    else:
        exist = subprocess.call("command -v dnf>> /dev/null", shell=True)
        if exist == 0:
            is_admin = os.getuid() == 0
            if is_admin == 1:
                os.system("dnf install neovim")
            else:
                exist = 1
                print(
                    "To use the installer with dnf you need to run this script with superuser privileges e.g. 'sudo python install.py'"
                )
    if exist == 0:
        os.system(
            "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
        )
else:
    print("Your Packet Manager is not supported")

if exist == 0:
    if os.path.isdir(home + "/.config/nvim"):
        os.system("mv " + home + "/.config/nvim " + home + "/.config/nvimBACKUP")
    os.system("mv ../nvim " + home + "/.config")
    print("You need to run :PackerSync inside nvim to compile your Packer packages")
