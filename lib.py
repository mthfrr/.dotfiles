#!/usr/bin/env python3

import glob
import itertools
from os.path import abspath, join, exists, expanduser, samefile, dirname
from os import rename, symlink, makedirs
from dataclasses import dataclass


def mk_symlink(rel_path):
    src = abspath(rel_path)
    dst = expanduser(join("~", rel_path))

    if exists(dst) and samefile(src, dst):
        return

    if exists(dst):
        rename(dst, dst + ".bkp")

    makedirs(dirname(dst), exist_ok=True)

    symlink(src, dst, target_is_directory=False)
    print(f"{dst} -> {src}")


def mk_file(rel_path):
    path = expanduser(join("~", rel_path))
    if exists(path):
        return
    makedirs(dirname(path), exist_ok=True)
    with open(path, "w"):
        pass
    print(f"+ {path}")


class ConfigElement:
    def __init__(self, name, files=[], package_dep=[], create_files=[]):
        self.name = name
        self.files = list(set(itertools.chain.from_iterable(
            glob.glob(x, recursive=True) for x in files)))
        self.package_dep = package_dep
        self.create_files = create_files

    def __repr__(self):
        return f"{self.name}: {self.files} | {self.package_dep} | {self.create_files}"

    def install(self):
        for f in self.files:
            mk_symlink(f)

        for f in self.create_files:
            mk_file(f)
        # install package_dep
        return


@ dataclass
class Package:
    def __init__(self, name, pkgs_names=None):
        self.name = name
        self.pkgs = pkgs_names if pkgs_names is not None else {}

    def is_installed(self, pkgmgr):
        return

    def install(self, pkgmgr):
        return
