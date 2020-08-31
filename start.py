import glob
from shutil import copyfile
from os.path import expanduser
import os
from pathlib import Path

home = os.path.expanduser("~")

for prefix in ["bash*", "git*"]:
    for f in glob.glob(prefix):
        if "mac" in f:
            print("not copying")
        else:
            copyfile(f, os.path.join(home, f".{f}"))
