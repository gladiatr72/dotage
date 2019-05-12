
# Stephen's dot files.

The more visual elements are built around the following CLI things:

  * python 3 virtual environments managed with _virtualenvwrapper_
  * tmux v2.4+
  * neovim 0.3+
  * bash 4+

Status integrations for:

  * kubernetes
  * postgres 9 (local, per-venv instances)
  * terraform


## Virtualenvwrapper hook scripts

## Bash bits

## Tmux bits

## Neovim

### scripting hosts

neovim supports individual thread pools for managing connectivity to what are
called _scripting host processes_ in the (generic) vim world.

Scripting host processes are used to facilitate the execution of neovim
plugins written in the language in question. This is in contrast to pure _vim-script_
plugins or those written in static/compiled-to-binary languages. Currently, python2/3,
_ruby_ and _nodejs_ are the three languages supported in this capacity.

Subsequently, nvim requires these languages supply a driver library as an API
gateway.

**NOTE**: I played around with _ruby_'s virtual environments without getting much
of a handle on them.  Since I do very little with ruby, its driver is naively
installed using `/usr/bin/gem`.  Just know that the same is recommended for ruby
as is for python even if not demonstrated here.

The following shows the installation of _pynvim_ into a python2 virtualenv. It is
recommended to use scripting host-specific virtual environments for the driver to
run from.


```bash

gladiatr@s:
[~]
:#  mkvirtualenv -p $( which python ) neovim-py2
[...]

(neovim-py2)
gladiatr@s:
[~/git/neovim-py2]
:# pip install pynvim

(neovim-py2)
gladiatr@s:
[~/git/neovim-py2]
:# deactivate

```


This shows the installation of the ruby neovim driver:


```bash

root@s:~# gem install neovim
Successfully installed neovim-0.8.0
Parsing documentation for neovim-0.8.0
Done installing documentation for neovim after 0 seconds
1 gem installed

```

Neovim comes with a handy built-in routine called `checkhealth` which
should give you something that looks like this when things are as they
should be:

```
 31 ...
 32 health#provider#check
 33 ========================================================================
 34 ## Clipboard (optional)
 35   - WARNING: No clipboard tool found. Clipboard registers (`"+` and `"*`) will not work.
 36     - ADVICE:
 37       - :help clipboard
 38
 39 ## Python 2 provider (optional)
 40   - INFO: Using: g:python_host_prog = "/home/gladiatr/.virtualenvs/neovim-py2/bin/python"
 41   - INFO: Executable: /home/gladiatr/.virtualenvs/neovim-py2/bin/python
 42   - INFO: Python version: 2.7.13
 43   - INFO: pynvim version: 0.3.2
 44   - OK: Latest pynvim is installed.
 45
 46 ## Python 3 provider (optional)
 47   - INFO: Using: g:python3_host_prog = "/home/gladiatr/.virtualenvs/neovim-py3/bin/python3"
 48   - INFO: Executable: /home/gladiatr/.virtualenvs/neovim-py3/bin/python3
 49   - INFO: Python version: 3.6.5
 50   - INFO: pynvim version: 0.3.2
 51   - OK: Latest pynvim is installed.
 52
 53 ## Ruby provider (optional)
 54   - INFO: Ruby: ruby 2.3.3p222 (2016-11-21) [x86_64-linux-gnu]
 55   - INFO: Host: /usr/local/bin/neovim-ruby-host
 56   - OK: Latest "neovim" gem is installed: 0.8.0
 57
 58 ## Node.js provider (optional)
 59   - INFO: Node.js: v8.9.0
 60   - INFO: Neovim node.js host: /home/gladiatr/u/install/node-v8.9.0-linux-x86/lib/node_module      s/neovim/bin/cli.js
 61   - OK: Latest "neovim" npm/yarn package is installed: 4.5.0

 ```





