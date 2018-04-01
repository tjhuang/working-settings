"
" VIMRC from Jacob Huang (tjhuang.lec@gmail.com)
"
" Latest Update at Apr. 1, 2018

execute pathogen#infect()

set autoindent
set tabstop=8
set shiftwidth=8

set nocompatible
set backspace=indent,eol,start
set showcmd
set showmode
set ruler
set history=100
set background=dark
set t_Co=256
colorscheme desert

" Search setting
set incsearch
set hlsearch
set ignorecase
set showmatch
set smartcase

" Solve the problem in shell script that `$()` is marked as error
let g:is_posix=1

syntax on
filetype on

set fileformat=unix
set fileformats=unix

" Set encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" Configure C/C++ syntax
autocmd BufRead,BufNewFile *.c,*.cpp,*.h    set cindent
autocmd BufRead,BufNewFile *.c,*.cpp,*.h    set filetype=c

" Configure Python syntax
autocmd BufRead,BufNewFile *.py    set smartindent
autocmd BufRead,BufNewFile *.py    set expandtab
autocmd BufRead,BufNewFile *.py    set tabstop=4
autocmd BufRead,BufNewFile *.py    set shiftwidth=4
autocmd BufRead,BufNewFile *.py    set filetype=python

" Set cursor line
set cursorline
highlight CursorLine cterm=none ctermbg=darkblue ctermfg=230

" Set number line
set number
highlight LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=none gui=NONE guifg=DarkGrey guibg=NONE 
"map <F4> :set number!<CR><Bar>:echo "Line Number: " . strpart("OffOn", 3 * &number, 3)<CR>


" Set constant value to be red and comment to be grey color
highlight Constant ctermfg=DarkRed
highlight Comment ctermfg=DarkGrey


" Edit binary using "xxd" format
augroup Binary
    autocmd!
    autocmd BufReadPre   *.bin    let &bin=1
    autocmd BufReadPost  *.bin    if &bin | %!xxd
    autocmd BufReadPost  *.bin    set ft=xxd | endif
    autocmd BufWritePre  *.bin    if &bin | %!xxd -r
    autocmd BufWritePre  *.bin    endif
    autocmd BufWritePost *.bin    if &bin | %!xxd
    autocmd BufWritePost *.bin    set nomod | endif
augroup END

" cscope
if has("cscope")
set csprg=/usr/local/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

set nomodeline


" for taglist.vim
"let Tlist_Ctags_Cmd = '/usr/local/bin/exctags'
"nnoremap <silent> <F8> :TlistToggle<CR>

" for SuperTab & pyCallTips
"let g:SuperTabDefaultCompletionType = "<C-N>"

" ins-completion options
"hi Pmenu ctermbg=DarkBlue ctermfg=Grey
"hi PmenuSel ctermbg=DarkGreen ctermfg=white


" spelling check
"map <F2> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" scripts
autocmd BufRead,BufNewFile *.pl		map <F5> :% w !clear; perl<CR>
autocmd BufRead,BufNewFile *.py		map <F5> :% w !clear; python<CR>
autocmd BufRead,BufNewFile *.sh		map <F5> :% w !clear; sh<CR>

if has("autocmd")
autocmd BufRead *.txt set tw=78
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
endif

"map <C-l> <ESC>:tabnext<CR>
"map <C-h> <ESC>:tabprev<CR>
"map <C-n> <ESC>:tabnew<CR>

" NERD Tree viewer
"map <F7> <ESC>:NERDTreeToggle<CR>
