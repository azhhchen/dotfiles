" Check vim-plug installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent! !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "vim-plug has been installedk"
endif

call plug#begin('~/.vim/plugged')

"=== UI ==="
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'

"=== Editor ==="
Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"=== Coding ==="
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'jayli/vim-easycomplete'
" Plug 'SirVer/ultisnips'        <- This needs python support and macOS version
" Plug 'honza/vim-snippets'      <-  does not have it (WTF Apple)

call plug#end()
