" remove annoying beep
set visualbell

set background=dark
colorscheme desert

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8 fileencodings=
syntax on
set showmatch " Shows matching brackets

:set mouse=a

set relativenumber
set cc=80

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4


autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»\ ,trail:·

set nofoldenable
setlocal foldmethod=syntax

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
