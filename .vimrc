" basic
set history=1000
set nocompatible
set tags=~/.tags,./tags,tags
set nu
set listchars=tab:>-,trail:$,extends:>,nbsp:% list
set si sw=4 ts=4
set backspace=2
set showcmd
set laststatus=2
set ruler
set colorcolumn=81
set ignorecase smartcase wrapscan hlsearch
set ambiwidth=double

" japanese encode '　'
set enc=utf-8
set fencs=ucs-bom,utf-8,iso-2022jp,euc-jp,sjis
set ff=unix
highlight ZenkakuSpace ctermbg=gray
autocmd ColorScheme * highlight ZenkakuSpace ctermbg=gray
call matchadd("ZenkakuSpace", '\%u3000')

" option
syntax on

" directry
set backupdir=$HOME/tmp,$HOME/temp,./

" autocmd
autocmd BufNewFile *.h 0r $HOME/vimtpl/cheader.txt
autocmd BufNewFile main.cpp 0r $HOME/vimtpl/cppmain.txt
autocmd BufNewFile main.c 0r $HOME/vimtpl/cmain.txt
autocmd BufNewFile Makefile 0r $HOME/vimtpl/makefile.txt

" fortran
let fortran_free_source=1

" for Align
let g:Align_xstrlen=3

" IME on off
"  挿入モードに入る時、保存されたIME状態を復元
"set t_SI+=[<r
let &t_SI .= "\e[<r"
"  挿入モードを出る時、IME状態を保存し、IMEをオフ
"set t_EI+=[<s[<0t
let &t_EI .= "\e[<s\e[<0t"
"  vimを終了する時、IMEをオフし、IME状態を保存
"set t_te+=[<0t[<s
let &t_te .= "\e[<0t\e[<0s"
" for screen
if &term == "screen.xterm"
	let &t_SI .= "\eP\e[<r\e\\"
	let &t_EI .= "\eP\e[<s\e[<0t\e\\"
	let &t_te .= "\eP\e[<0t\e[<0s\e\\"
endif
if &term == "screen"
	let &t_SI .= "\eP\e[<r\e\\"
	let &t_EI .= "\eP\e[<s\e[<0t\e\\"
	let &t_te .= "\eP\e[<0t\e[<0s\e\\"
endif
"  エスケープシーケンスを区別するための待機時間の設定
set ttimeoutlen=100

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
