set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'natebosch/vim-lsc'
Plugin 'dense-analysis/ale'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:lsc_server_commands = {
    \ 'c': { 'command': 'clangd', 'suppress_stderr': v:true },
    \ 'python': { 'command': 'pyls' },
    \}
let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_map = v:true
set completeopt-=preview

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_c_checkers=['gcc', 'make']
" let g:syntastic_c_compiler_options="-Wall -Wextra -pedantic -std=c99"
" let g:syntastic_c_check_header=1

let g:ale_fix_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1
let g:ale_c_parse_makefile=1
let g:ale_c_gcc_options="-Wall -Wextra -pedantic -std=c99"
let g:ale_linter={
    \ 'c': ['gcc']
    \ }
let g:ale_fixers={
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'c': ['clang-format']
    \ }
let g:ale_c_clangformat_use_local_file=1
" let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc

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
set ttymouse=sgr

set number
" set relativenumber
set cc=80

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set cinoptions+=:0


command W w
command Q q
command Wq wq
command WQ wq

let mapleader="\<Space>"
nnoremap <Space> <nop>
nnoremap <Leader>f :Explore<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :source<Space>$MYVIMRC<CR>
nnoremap <Leader>d :LSClientGoToDefinitionSplit<CR>
nnoremap <Leader>r :LSClientFindReferences<CR>

inoreabbrev #i #include
inoreabbrev #d #define
inoreabbrev st struct

set autowrite " enable saving before make

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»\ ,trail:·

" inoremap ( ()<Esc>i
" inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
" inoremap [ []<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i

set nofoldenable
setlocal foldmethod=syntax

let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

" reduce latency when escaping
set ttimeoutlen=10

" Auto generate tags file on file write of *.c and *.h files
" autocmd BufWritePost *.c,*.h silent! !ctags . &

autocmd BufRead,BufNewFile *.c,*.h setlocal comments=s:/**,mb:**,ex:*/,s:/*,mb:**,ex:*/
packadd termdebug

set path+=,/run/current-system/sw/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include-fixed,/nix/store/9r0a3dipi8saq2zasp668zsk6qhqp5jb-glibc-2.32-48-dev/include

" :rename[!] {newname}

command! -nargs=* -complete=customlist,SiblingFiles -bang Rename :call Rename("<args>", "<bang>")
cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<CR>

function! SiblingFiles(A, L, P)
    return map(split(globpath(expand("%:h") . "/", a:A . "*"), "\n"), 'fnamemodify(v:val, ":t")')
endfunction

function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curpath = expand("%:h") . "/"
    let v:errmsg = ""
    silent! exe "saveas" . a:bang . " " . fnameescape(l:curpath . a:name)
    if v:errmsg =~# '^$\|^E329'
        let l:oldfile = l:curfile
        let l:curfile = expand("%:p")
        if l:curfile !=# l:oldfile && filewritable(l:curfile)
            silent exe "bwipe! " . fnameescape(l:oldfile)
            if delete(l:oldfile)
                echoerr "Could not delete " . l:oldfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
