set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
syntax on
"setlocal spell

" Vim-LaTeX stuff
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype on
filetype plugin on " This enables automatic indentation as you type.
filetype indent on " file type based indentationiletype plugin on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" End of Vim-LaTeX stuff

" set termguicolors
set t_Co=256

" file expolorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

syntax enable           " enable syntax processing
set cursorline
colorscheme jellybeans
"colorscheme dracula
"colorscheme seoul256
"let g:gruvbox_contrast_dark="hard"
"colorscheme gruvbox

" set auto and smart indentation
set autoindent smartindent

" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" specific file types
autocmd FileType make setlocal nospell noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType python setlocal nospell tabstop=4 colorcolumn=79
autocmd BufEnter *.tex set nospell tabstop=2 softtabstop=2 shiftwidth=2

" Python syntax highlighting related
let g:python_highlight_all = 1

" stricter rules for C programs
set cindent

" cursor row and column highlight
set cursorcolumn cursorline

" set relative line numbers
set relativenumber

imap <f12> <c-o>:call ToggleHebrew()<cr>
map <f12> :call ToggleHebrew()<cr>

func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc

set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
"set paste           " paste normaly
set foldenable      " enable folding
set foldnestmax=10  " 10 nested fold max
nnoremap <space> za " space open/closes folds

nnoremap B ^
nnoremap E $

:cd %:p:h
let g:Tex_Env_answer = "\\if\\withsol1{\<CR>\\begin{answer}\<CR><++>\<CR>\\end{answer}\<CR>}\\fi"
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR>\\end{frame}"
let g:Tex_SmartKeyQuote = 0
let g:Tex_SmartKeyDot = 0
let g:Tex_Env_tikzinfigure = "\\begin{figure}[H]\<CR>\\centering\<CR>\\begin{tikzpicture}\<CR><++>\<CR>\\end{tikzpicture}\<CR>\\end{figure}"

autocmd FileType tex :setlocal sw=2 ts=2 sts=2

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: iso-8859-15 -*-\<nl>\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env zsh\"|$
  autocmd BufNewFile *.cc 0put =\"#include <iostream>\<nl>\<nl>int main(int argc, char **argv){\<nl>\<nl>\treturn 0;\<nl>}\"|$
augroup END

" vim-airline
set laststatus=2

" python highlight in L
"call SyntaxRange#IncludeEx('start="\\begin{pycode\}$" end="\\end{pycode\}$"', 'python')

vnoremap <F2> :s/^/#/g <cr>
nnoremap <F3> :let @/="" <cr>
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
nmap <F8> :TagbarToggle<CR>

let g:vimtex_include_search_enabled = 0

" Jedi-Vim related
let g:jedi#auto_initialization = 0
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#use_splits_not_buffers = "left"
