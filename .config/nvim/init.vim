" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'

Plug 'sheerun/vim-polyglot'

Plug 'airblade/vim-gitgutter'

call plug#end()

set background=dark
colorscheme gruvbox

set belloff=all
set nobackup
set nowritebackup
set encoding=utf-8 fileencodings=

set clipboard=unnamedplus

set showmatch " Shows matching brackets
set list listchars=tab:»\ ,trail:·

" cursor setup
let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

" mouse
set mouse=a

set number
set cc=80

" indent
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autowrite " enable saving before make

packadd termdebug

" reduce latency when escaping
set ttimeoutlen=10

" usual typo and shortcuts
command W w
command Q q
command Wq wq
command WQ wq

" custom shotcuts
let mapleader="\<Space>"
nnoremap <Space> <nop>
nnoremap <Leader>f :Explore<CR>
nnoremap <Leader>w :w<CR>


" Make
autocmd Filetype make call SetMakeOptions()
function SetMakeOptions()
    setlocal noexpandtab
endfunction

" C
autocmd BufRead,BufNewFile *.c,*.h call SetCOptions()
function SetCOptions()
    inoreabbrev #i #include
    inoreabbrev #d #define
    inoreabbrev #p #pragma
    inoreabbrev st struct
    inoremap {<CR> {<CR>}<Esc>ko

    setlocal comments=s:/**,mb:**,ex:*/,s:/*,mb:**,ex:*/
    setlocal cinoptions+=:0 " case statement indent fix
endfunction

" ### Plugins ###

let g:airline_powerline_fonts = 1

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

