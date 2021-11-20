# install script for this nvim on arch linux (NOT on windows)
import os
home = os.path.expanduser("~")
print(
    "██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗",
    "██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
    "██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║",
    "██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
    " ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
)
os.system("yay -R --noconfirm neovim")
os.system("yay -S --noconfirm neovim-git nvim-packer-git")
if os.path.isdir(home + "/.config/nvim"):
    os.system("mv " + home + "/.config/nvim " + home + "/.config/nvimBACKUP")
os.system("mv ../nvim " + home + "/.config")
