
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/home/gladiatr/.config/nvim/bundle/neobundle.vim/
endif

if filereadable(expand('~/.vimrc.before'))
	source ~/.vimrc.before
endif

" Required:
call neobundle#begin(expand('/home/gladiatr/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles there:
source ~/.vimrc.plugs

" Required:
call neobundle#end()

" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" NeoBundleCheck
"End NeoBundle Scripts-------------------------

source ~/.vimrc.local
" source ~/.vimrc.test
