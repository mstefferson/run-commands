import glob
from shutil import copyfile
from os.path import expanduser
import os
from pathlib import Path
import subprocess

home = os.path.expanduser("~")

for prefix in ["bash*", "git*", "screen*"]:
    for f in glob.glob(prefix):
        copyfile(f, os.path.join(home, f".{f}"))

# vundle install
subprocess.call(["git", "clone", "https://github.com/VundleVim/Vundle.vim.git", f"{home}/.vim/bundle/Vundle.vim"])
