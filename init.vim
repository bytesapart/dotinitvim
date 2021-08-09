set number

" Auto-Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'arcticicestudio/nord-vim'
	Plug 'itchyny/lightline.vim'
	Plug 'navarasu/onedark.nvim'
call plug#end()

colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

