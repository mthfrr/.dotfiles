call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'


Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-sensible'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rhysd/vim-clang-format'

call plug#end()

" clang-format
let g:clang_format#code_style="FILE"
autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.hh ClangFormatAutoEnable

" remove annoying beep
set belloff=all

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set encoding=utf-8 fileencodings=

" visual
set background=dark
colorscheme gruvbox
syntax on
set showmatch " Shows matching brackets
set list listchars=tab:»\ ,trail:·
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" cursor setup
let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

" mouse
set mouse=a
set ttymouse=sgr " wide monitor mouse fix

set number
set cc=80

" indent
filetype plugin indent on
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4


" usual typo and shortcuts
command W w
command Q q
command Wq wq
command WQ wq

inoreabbrev #i #include
inoreabbrev #d #define
inoreabbrev #p #pragma
inoreabbrev st struct

" custom shotcuts
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'


let mapleader="\<Space>"
nnoremap <Space> <nop>
nnoremap <Leader>f :Explore<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>m :Silent make<CR>

" c braces setup
inoremap {<CR> {<CR>}<Esc>ko

set autowrite " enable saving before make

" set foldes
set nofoldenable
setlocal foldmethod=syntax

" reduce latency when escaping
set ttimeoutlen=10

" FILETYPE SPECIFICS

" makefiles options
autocmd Filetype make setlocal noexpandtab

" c files
autocmd BufRead,BufNewFile *.c,*.h setlocal comments=s:/**,mb:**,ex:*/,s:/*,mb:**,ex:*/
autocmd BufRead,BufNewFile *.c,*.h setlocal cinoptions+=:0 " case statement indent fix
autocmd BufRead,BufNewFile *.c,*.h setlocal path+=,/run/current-system/sw/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include-fixed,/nix/store/9r0a3dipi8saq2zasp668zsk6qhqp5jb-glibc-2.32-48-dev/include

packadd termdebug

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
            \ 'coc-clangd',
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
