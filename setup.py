#!/usr/bin/env python3

from lib import ConfigElement, Package

configElements = [
    ConfigElement("bash", [".bash*"], ["bash"], [".bashrc_local"]),
    ConfigElement("vim", [".vimrc", ".vim/coc-settings.json",
                  ".vim/autoload/plug.vim"], ["vim", "nodejs"]),
    ConfigElement("git", [".gitconfig"], ["git"]),
    ConfigElement("i3", [".config/i3/config", ".config/i3status/config"]),
    ConfigElement("kitty", [".config/kitty/kitty.conf"], ["kitty"]),
]

packages = {
    "bash": Package("bash"),
    "vim": Package("vim"),
    "nodejs": Package("nodejs"),
    "git": Package("git"),
    "kitty": Package("kitty"),
}


def main():
    for c in configElements:
        print(c)
        c.install()


if __name__ == "__main__":
    main()
