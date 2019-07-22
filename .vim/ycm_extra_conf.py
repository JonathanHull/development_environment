import os
import ycm_core

flags = [
  '-Wall',
  '-Wshadow',
  '-Wextra',
  '-Werror',
  '-Wno-long-long',
  '-Wno-variadic-macros',
  '-fexceptions',
  '-ferror-limit=10000',
  '-x', 'c++',
  '-isystem', '/usr/include/c++/7.2.1',
  '-isystem', '/usr/include/c++/7.2.1/x86_64-pc-linux-gnu',
  '-isystem', '/usr/include/c++/7.2.1/backward',
  '-isystem', '/usr/local/include',
  '-isystem', '/usr/include',
  #'-DNDEBUG',
  #'-std=c99',
  #'-xc',
  #'-isystem/usr/include/',
  ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }

def Settings(**kwargs):
    if kwargs['language'] == 'go':
        return {"language_server": [ {
            "name": "gopls",
            "cmdline": ["/home/jonathan/go/bin/gopls", "-rpc.trance" ],
            "filetypes": ["go"],
            "project_root_files": ["go.mod"]
            } ]
        }


