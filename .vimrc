call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

" remove annoying beep
set belloff=all

set background=dark
colorscheme gruvbox


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8 fileencodings=
syntax on
set showmatch " Shows matching brackets

set mouse=a

set number
" set relativenumber
set cc=80

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autowrite " enable saving before make

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»\ ,trail:·

set nofoldenable
setlocal foldmethod=syntax

let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

" reduce latency when escaping
set ttimeoutlen=10

" Auto generate tags file on file write of *.c and *.h files
" autocmd BufWritePost *.c,*.h silent! !ctags . &

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
