import sys
from distutils.core import setup
import py2exe

py2exe_options = {
    'compressed': 1,
    'optimize': 2,
    'includes': [],
    "excludes": ["tcl","Tkinter","PyQt","bz2", "readline"],
    'dll_excludes': [],
    "packages": [],
    'bundle_files':2
}

setup(
    options = {'py2exe': py2exe_options},
    console = [{
        'script' : 'snd2wav.py',
        'icon_resources': [],
        'other_resources': [],
    }],
    data_files =[],
    zipfile = None
)

setup(
    options = {'py2exe': py2exe_options},
    console = [{
        'script' : 'wav2snd.py',
        'icon_resources': [],
        'other_resources': [],
    }],
    data_files =[],
    zipfile = None
)
