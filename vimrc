if bufwinnr(1)
  map + <C-w>+
  map - <C-w>-
endif

map K i<Enter><Esc> 

" switch to insert with jj
 imap jj <Esc>

 " disable arrow keys
    map <up> <C-n>
    map <down> <C-n>
    map <left> <C-n>
    map <right> <C-n>
    imap <up> <C-n>
    imap <down> <C-n>
    imap <left> <C-n>
    imap <right> <C-n>


"silent
"colorscheme charon


set number
set list!
set listchars=tab:._
highlight  Comment ctermfg=yellow
"set nocompatible    " use vim defaults
set expandtab       " ex
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set softtabstop=4
set shiftwidth=4    " numbers of spaces to autoindent
"set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
"set noignorecase   " don't ignore case
set title           " show title in console title bar 
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
"set noautoindent

"set nosmartindent
"set nocindent  

"let &t_ti.="\e[?30l"
"let &t_te.="\e[?30h"


"filetype plugin on

set foldmethod=indent
set foldnestmax=10
set nofoldenable
" set foldlevel=1 

"set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

syntax on           " syntax highlighing
hi Folded ctermfg=0
hi Comment    gui=NONE guifg=#e3d1e3

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
     " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
     
     au FileType cpp,c,java,sh,pl,php,asp  set autoindent
     au FileType cpp,c,java,sh,pl,php,asp  set smartindent
     au FileType cpp,c,java,sh,pl,php,asp  set cindent
       
     " File formats
     au BufNewFile,BufRead  *.pls    set syntax=dosini
     au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

call pathogen#infect()

setlocal makeprg=tidy\ -quiet\ -errors\ %
setlocal errorformat=line\ %l\ column\ %v\ -\ %m

"php doc plugin
source ~/.vim/php-doc.vim 
inoremap <C-O> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-O> :call PhpDocSingle()<CR> 
vnoremap <C-O> :call PhpDocRange()<CR> 

map ` 10-10+



let NERDTreeShowHidden=1

