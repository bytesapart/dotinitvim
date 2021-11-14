"=======================================================
"BASIC VIM SETTINGS
"=======================================================
" set runtimepath=/usr/bin/local	" Currently not used, use the default runtimepath -> https://superuser.com/questions/152891/what-is-a-vim-runtime-directory
set nocompatible			" use VIM instead of VI. Not needed if using Neovim.
set autoindent				" Automatic Indentation -> https://vim.fandom.com/wiki/Indenting_source_code
set hlsearch				" For highlighting search results -> https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
set backspace=indent,eol,start		" Replicate original behaviour of the backspace button -> https://til.hashrocket.com/posts/f5531b6da0-backspace-options
set incsearch				" Make searches incremental -> https://stackoverflow.com/questions/25635413/vim-incremental-search
set showcmd				" For showing what you've been typing, aka, history -> https://stackoverflow.com/questions/9656230/how-to-know-commands-ive-been-typing
set number				" For showing the line numbers.
set ruler				" For showing the ruler near line numbers
set history=700				" Set the number of command history
set autoread				" Autoread when file is changed from some other source outside of vim
set wildmenu				" Turn on wildmenu -> https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildignore=*.o,*~,*.pyc		" Add exceptions to the files in wildmenu to be ignored. Mostly obj and pyc files.
set cmdheight=2				" Set the height of the command bar
set showmatch				" Show matching brackets when cursor is over one of them
set cul					" Highlight the current line
set encoding=utf8			" Set the encoding of every file to UTF-8
set lazyredraw				" Helps in loading the files faster
set ttyfast				" Faster connection over remote SSH terminal
set guioptions-=T			" Removes the menubar if using gVim or nvim-qt on Windows
set guioptions-=r			" Remove the right scrollbar
set guioptions-=L			" Remove the left scrollbar
set expandtab				" Convert Tabs to Spaces to prevent Nuclear Disaster!
set smarttab				" Affects how <TAB> key presses are interpreted depending on the cursor -> https://vim.fandom.com/wiki/Indenting_source_code
set shiftwidth=8			" For the above smarttab setting
set tabstop=4				" For the above smartab setting
set wrap				" Wrap existing characters
set nobackup				" Turn backups off
set nowb				" Turn backups off
set noswapfile				" Turn swapfiles off

"=====================================================
"REMAPPING
"=====================================================
" map tab switching
" Maybe change these to something more easier to reach?
map <F9> :tabprevious<CR>
map <S-F9> :tabnext<CR>


"=====================================================
"ALL PLUGIN STUFF
"=====================================================

" Auto-Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" My Bundles here:
" nerdtree          : file explorer
" jedi-vim          : auto complete for python
" vim-nerdtree-tabs : permanent nerdtree on all tabs
" fugitive          : git integration
" syntastic         : error highlighter
" ctrlp             : fuzzy search
" vim-easymotion    : easy navigation
" closetag          : html xml auto close tags
" tagbar            : ctags based function lists
" supertab          : autocomplete
" detectindent      : autoindent
" numbers           : smart numbers for vim
" lightline	    : Airline for VIM

call plug#begin('~/.config/nvim/autoload/plugged')
	" Plug 'arcticicestudio/nord-vim'
	" Plug 'navarasu/onedark.nvim'
	Plug 'itchyny/lightline.vim'
	Plug 'sickill/vim-monokai'
	Plug 'scrooloose/nerdtree'
	Plug 'klen/python-mode'
	Plug 'davidhalter/jedi-vim'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/syntastic'
	Plug 'kien/ctrlp.vim'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'docunext/closetag.vim'
	Plug 'majutsushi/tagbar'
	Plug 'ervandew/supertab'
	Plug 'ciaranm/detectindent'
	Plug 'rstacruz/sparkup'
	Plug 'Valloric/YouCompleteMe'
	Plug 'myusuf3/numbers.vim'
	Plug 'rosenfeld/conque-term'
	Plug 'sjl/gundo.vim'
call plug#end()

"=====================================================
" ALL ADDED COLORSCHEMES
"=====================================================
colorscheme monokai
set background=dark

filetype off                   " required!
filetype plugin indent on     " required!
filetype plugin on

let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }

"====================================================
"AUTOCOMMANDS
"====================================================
augroup vimrc_autocmds
	autocmd!
	
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
    autocmd Filetype html,xml,xsl source ~/.config/nvim/autoload/plugged/closetag.vim/plugin/closetag.vim
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    "code folding settings
    "use zo to open folds and zc to close
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=syntax | setlocal foldnestmax=1 | endif

augroup END

"======================================================
"CONFIG ADDED BUNDLES
"======================================================

"POWERLINE
"------------------------------------------------------
set laststatus=2

" NERDTREE
" -----------------------------------------------------
" map F2 to NerdTree toggle
au VimEnter *  NERDTree
map <F2> :NERDTreeToggle<CR>

" PYMODE
" -----------------------------------------------------
	let g:pymode_rope = 0 
	" Documentation
		let g:pymode_doc = 1
		let g:pymode_doc_key = 'K'
	"Linting
		let g:pymode_lint = 1
		let g:pymode_lint_checker = "pyflakes,pep8"
	" Auto check on save
		let g:pymode_lint_write = 1
	" Support virtualenv
		let g:pymode_virtualenv = 1
	" Enable breakpoints plugin
		let g:pymode_breakpoint = 1
		let g:pymode_breakpoint_key = '<leader>b'
	" syntax highlighting
		let g:pymode_syntax = 1
		let g:pymode_syntax_all = 1
		let g:pymode_syntax_indent_errors = g:pymode_syntax_all
		let g:pymode_syntax_space_errors = g:pymode_syntax_all
	" Don't autofold code
		let g:pymode_folding = 0

"CLOSETAG
"------------------------------------------------------
:let g:closetag_html_style=1
:source ~/.config/nvim/autoload/plugged/closetag.vim/plugin/closetag.vim

"TAGBAR
"------------------------------------------------------
map tb :TagbarToggle<CR>

"DETECTINDENT
"------------------------------------------------------
:let g:detectindent_preferred_expandtab=1
:let g:detectindent_preferred_indent=8

"SUPERTAB CONFIG
"------------------------------------------------------
:let g:SuperTabMappingForward = '<C-space>'
:let g:SuperTabMappingBackward = '<s-c-space>'

"Numbers setup
"------------------------------------------------------
nnoremap <F3> :NumbersToggle<CR>

" SYNTASTIC IGNORE SETTINGS
let g:syntastic_python_checker_args="--ignore=E501"
