" basic
set history=9000
set nocompatible
set tags=~/.tags,./tags,tags
set nu
set listchars=tab:>-,trail:$,extends:>,nbsp:% list
set si sw=4 ts=4 expandtab
set backspace=2
set showcmd
set laststatus=2
set ruler
set colorcolumn=81
set ignorecase smartcase wrapscan hlsearch
set ambiwidth=double

" japanese encode
set enc=utf-8
set fencs=ucs-bom,utf-8,iso-2022jp,euc-jp,sjis
set ff=unix

" 特殊強調 '　' 'NOTE:'
highlight ZenkakuSpace cterm=none
autocmd ColorScheme * highlight ZenkakuSpace ctermbg=darkgray
let myMatch = matchadd("ZenkakuSpace", '　')
highlight MyNote cterm=none
autocmd ColorScheme * highlight MyNote ctermbg=Green ctermfg=black
let myMatch = matchadd("MyNote", "NOTE:")

" option
syntax on

" directry
set backupdir=$HOME/tmp,$HOME/temp,./

" template
autocmd BufNewFile *.h 0r $HOME/vimtpl/cheader.tpl
autocmd BufNewFile main.cpp 0r $HOME/vimtpl/cppmain.tpl
autocmd BufNewFile main.c 0r $HOME/vimtpl/cmain.tpl
autocmd BufNewFile Makefile 0r $HOME/vimtpl/makefile.tpl

" fortran
let fortran_free_source=1

" for Align
let g:Align_xstrlen=3

" IME on off (for Windows)
"  "(original)
"  "set t_SI+=[<r
"  "set t_EI+=[<s[<0t
"  "set t_te+=[<0t[<s
"  挿入モードに入る時、保存されたIME状態を復元
"let &t_SI .= "\e[<r"
"  挿入モードを出る時、IME状態を保存し、IMEをオフ
"let &t_EI .= "\e[<s\e[<0t"
"  vimを終了する時、IMEをオフし、IME状態を保存
"let &t_te .= "\e[<0t\e[<0s"
" for screen
"if &term == "screen.xterm"
"    let &t_SI .= "\eP\e[<r\e\\"
"    let &t_EI .= "\eP\e[<s\e[<0t\e\\"
"    let &t_te .= "\eP\e[<0t\e[<0s\e\\"
"endif
"if &term == "screen"
"    let &t_SI .= "\eP\e[<r\e\\"
"    let &t_EI .= "\eP\e[<s\e[<0t\e\\"
"    let &t_te .= "\eP\e[<0t\e[<0s\e\\"
"endif
"  エスケープシーケンスを区別するための待機時間の設定
"set ttimeoutlen=100

" CROSS CURSOR
let g:condCC = 0
function! CrossCursor()
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    let g:condCC = 1
endfunction
function! NCrossCursor()
    au WinEnter * set nocursorline nocursorcolumn
    let g:condCC = 0
endfunction
function! ToggleCrossCursor()
    if ! g:condCC
        set cursorline cursorcolumn
        call CrossCursor()
        echo "CrossCursor ON"
    else
        set nocursorline nocursorcolumn
        call NCrossCursor()
        echo "CrossCursor OFF"
    endif
endfunction

" keymap
" コマンドモードで左右移動をする
cnoremap <C-k> <Left>
cnoremap <C-l> <Right>
" 通常表示行単位で行移動
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" calucrator
vnoremap ,c da<C-R>=<C-F>p<CR><ESC>
" toggleCrossCursor
nnoremap ,3 :call ToggleCrossCursor()<CR>
" nohl
nnoremap ,h :nohl<CR>
" ZZ to zz
nnoremap ZZ zz
" insert date
nnoremap ,d i<C-R>=strftime("%Y/%m/%d %T")<CR><ESC>


" colorscheme
" if 256-color is NG
"autocmd ColorScheme * hi Special ctermfg=lightgreen cterm=bold
"autocmd ColorScheme * hi PreProc ctermfg=lightblue cterm=bold
"autocmd ColorScheme * hi LineNr  ctermfg=gray      cterm=none
"autocmd ColorScheme * hi Search  ctermfg=darkgray ctermbg=lightyellow
"autocmd ColorScheme * hi CursorColumn cterm=bold
"autocmd ColorScheme * hi CursorLine   cterm=underline
"colorscheme desert
" if 256-color is OK
set t_Co=256
"autocmd ColorScheme * hi Special      ctermfg=119       cterm=none
"autocmd ColorScheme * hi PreProc      ctermfg=51        cterm=none
"autocmd ColorScheme * hi LineNr       ctermfg=247       cterm=none
"autocmd ColorScheme * hi Search       ctermfg=236       ctermbg=183
"autocmd ColorScheme * hi CursorColumn cterm=bold
"autocmd ColorScheme * hi CursorLine   cterm=underline
colorscheme ayacaj

if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
