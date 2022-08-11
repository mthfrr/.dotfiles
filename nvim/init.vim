" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-sensible'

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set shiftwidth=2
set tabstop=2
set softtabstop=2

set autowrite " enable saving before make

" prevent creation of .netrwhist files
let g:netrw_dirhistmax=0

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
nnoremap <Leader>q :q<CR>

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

autocmd BufRead,BufNewFile c,python,java,javascript call SetTablenOptions()
function SetTablenOptions()
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal softtabstop=4
endfunction

" ### Plugins ###

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CoC
set hidden
set cmdheight=2 " recomand 2
set shortmess+=c


" let g:coc_confing_home = '~/path/to/coc-settings.json'
let g:coc_global_extensions = [
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-pyright',
            \ 'coc-java',
            \ 'coc-cmake',
            \ 'coc-vimlsp',
            \ ]

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
