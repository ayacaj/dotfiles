" Vim color file
" Maintainer:    ayacaj
" Last Change:    $Date: 2018/06/30 20:36:19
" Comment:    "desert.vim" is base of this colorscheme.

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="ayacaj"

"***   for GUI   ***
hi Normal    guibg=grey20 guifg=White

" highlight groups
hi Cursor    guibg=khaki  guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit    guibg=#c2bfa5   guifg=grey50       gui=none
hi Folded       guibg=grey30    guifg=gold
hi FoldColumn   guibg=grey30    guifg=tan
hi IncSearch    guibg=khaki     guifg=slategrey
"hi LineNr
hi ModeMsg                      guifg=goldenrod
hi MoreMsg                      guifg=SeaGreen
hi NonText      guibg=grey30    guifg=LightBlue
hi Question                     guifg=springgreen
hi Search       guibg=peru      guifg=wheat
hi SpecialKey                   guifg=yellowgreen
hi StatusLine   guibg=#c2bfa5   guifg=black        gui=none
hi StatusLineNC guibg=#c2bfa5   guifg=grey50       gui=none
hi Title                        guifg=indianred
hi Visual       guibg=olivedrab guifg=khaki      gui=none
"hi VisualNOS
hi WarningMsg                   guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment     guifg=SkyBlue
hi Constant    guifg=#ffa0a0
hi Identifier  guifg=palegreen
hi Statement   guifg=khaki
hi PreProc     guifg=indianred
hi Type        guifg=darkkhaki
hi Special     guifg=navajowhite
"hi Underlined
hi Ignore      guifg=grey40
"hi Error
hi Todo        guifg=orangered guibg=yellow2

"***   for CUI   ***
" 256 color terminal definitions
hi SpecialKey                       ctermfg=240
hi NonText       cterm=bold         ctermfg=24
hi Directory                        ctermfg=63
hi ErrorMsg      cterm=bold         ctermfg=7          ctermbg=1
hi IncSearch     cterm=none         ctermfg=11         ctermbg=2
hi Search        cterm=none         ctermfg=233        ctermbg=183
hi MoreMsg                          ctermfg=79
hi ModeMsg       cterm=none         ctermfg=136
hi LineNr        cterm=none         ctermfg=247
hi Question                         ctermfg=106
hi StatusLine    cterm=bold,reverse
hi StatusLineNC  cterm=reverse
hi VertSplit     cterm=reverse
hi Title                            ctermfg=5
hi Visual        cterm=reverse
hi VisualNOS     cterm=bold,underline
hi WarningMsg                       ctermfg=1
hi WildMenu                         ctermfg=0          ctermbg=3
hi Folded                           ctermfg=8          ctermbg=none
hi FoldColumn                       ctermfg=8          ctermbg=none
hi DiffAdd                                             ctermbg=20
hi DiffChange                                          ctermbg=55
hi DiffDelete    cterm=bold         ctermfg=6          ctermbg=52
hi DiffText      cterm=bold                            ctermbg=1
hi Comment                          ctermfg=130
hi Constant                         ctermfg=13
hi Special       cterm=none         ctermfg=119
hi Identifier                       ctermfg=162
hi Statement                        ctermfg=3
hi PreProc       cterm=none         ctermfg=51
hi Type                             ctermfg=2
hi Underlined    cterm=underline    ctermfg=5
hi Ignore                           ctermfg=238
hi Error         cterm=bold         ctermfg=7          ctermbg=1
hi CursorColumn  cterm=bold
hi CursorLine    cterm=underline
hi Todo                             ctermfg=17         ctermbg=214
hi WarningMsg    cterm=bold         ctermfg=0          ctermbg=11
hi Normal                           ctermfg=250

" if 256-color is not supported
"hi Special      cterm=bold         ctermfg=lightgreen
"hi PreProc      cterm=bold         ctermfg=lightblue
"hi LineNr       cterm=none         ctermfg=gray
"hi Search                          ctermfg=darkgray   ctermbg=lightyellow
"hi CursorColumn cterm=bold
"hi CursorLine   cterm=underline

"vim: sw=4
