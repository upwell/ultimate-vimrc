"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: amix the lucky stiff
"             http://amix.dk - amix@amix.dk
" " Version: 3.6 - 25/08/10 14:40:30
"
" Blog_post:
"       http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" How_to_Install_on_Unix:
"    $ mkdir ~/.vim_runtime
"    $ cat ~/.vim_runtime/install.sh
"    $ sh ~/.vim_runtime/install.sh <system>
"      <sytem> can be `mac`, `linux` or `windows`
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" for pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" vundle
set nocompatible
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#rc()
" Bundle 'gmarik/Vundle.vim'

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'

NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-scripts/ingo-library'
NeoBundle 'vim-scripts/AdvancedSorters'

NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/gitv'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'skwp/greplace.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'dkprice/vim-easygrep'

NeoBundle 'klen/python-mode'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'fatih/vim-go'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'exu/pgsql.vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'derekwyatt/vim-scala'

" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'henrik/rename.vim'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Yggdroot/indentLine'

call neobundle#end()

" end of neobundle
""""""""""""""""""""""""""""""""""""""""""""""""""


" Set to auto read when a file is changed from the outside
set autoread

" Enable filetype plugin
filetype plugin indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>r :e! ~/.vim_runtime/vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if MySys() == "mac"
  set gfn=Input\ Mono:h14
  set shell=/bin/bash
elseif MySys() == "linux"
  set gfn=Inconsolata\ 12
  set shell=/bin/bash
endif

set cursorline
if has("gui_running") && MySys() != "mac"
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guifont=Yahei\ Consolas\ Hybrid\ 14
  set t_Co=256
  set background=dark
  colorscheme solarized
  set nonu
else
  set t_Co=16
  set background=light
  colorscheme solarized
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    set undodir=~/.vim_runtime/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"adjust the indent for pulic in c++
"see :he cinooptions-values for more info
set cino=g0

set colorcolumn=100

" fullscreen for gvim
function! ToggleFullScreen()
    call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")
endfunction
map <silent> <F11> :call ToggleFullScreen()<CR>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" NOTICE: Really useful!

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // <C-R>=expand('%:p:h') . '/'<CR>*.
"map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"
" From an idea by Michael Naumann
"
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d c <C-\>eCurrentFileDir("e")<cr>
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
"map <right> :bn<cr>
"map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=1
catch
endtry

" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"Remeber open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py,*.c,*.h,*.cpp,*.java,*.jsp,*.txt,*.sql,*.conf :call DeleteTrailingWS()
nmap <Leader>ds :call DeleteTillSlash()<CR>

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
let g:bufExplorerUseCurrentWindow=1
map <leader>o :BufExplorer<cr>
map <leader>s :BufExplorerHorizontalSplit<cr>
map <leader>v :BufExplorerVerticalSplit<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 30
let g:miniBufExplSplitBelow=1

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

" Delete current word
imap <C-d> <C-o>diw

if MySys() == "mac"
    if has("gui_running")
      set fuoptions=maxvert,maxhorz
      au GUIEnter * set fullscreen
    endif
endif

" Map ESC with jj
imap jj <ESC>
" Map taglist with tt
nmap tt :TlistToggle<cr>

" Use \e instead of :e to edit file in the same directory
" with the current file
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>sp :sp <C-R>=expand('%:p:h') . '/'<CR>

" Auto Close the Tag list of inactive buffer
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1

" Highlight tabs and spaces
au BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
au FileType help NoSpaceHi

" json support
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" tags file
" if filereadable(glob("~/.vim_runtime/tags/header/tags"))
"     set tags+=~/.vim_runtime/tags/header/tags
" endif

" Really easy pasting supported in Vim Version 7.3 or higher
" Only work on the host system, remote ssh not work
if v:version >= 703
    map <Leader>vv  :set paste<CR>i<C-r>*<C-O>:set nopaste<CR><ESC>
    imap <Leader>vv  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>
endif

" indexer plugin settings
let g:indexer_disableCtagsWarning=1

" plpgsql syntax
au BufNewFile,BufRead *.sql set filetype=pgsql

" vimdiff shortcut
map <Leader>df :diffput<CR>
map <Leader>dg :diffget<CR>

" markdown related
let g:vim_markdown_folding_disabled = 1

" syntastic options
" let g:syntastic_python_pylint_args='-d C0111'
" pylint is really slow, disable it
let g:syntastic_python_checkers = ['flake8', 'pyflakes']
let g:syntastic_python_flake8_args = "--max-line-length=120"

" python mode
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_folding = 0
let g:pymode_rope_completion = 0
let g:pymode_run = 1
let g:pymode_run_bind = '<leader><leader>r'
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_options_max_line_length = 120

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" youcompleteme
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_filetype_blacklist = {'html': 1, 'txt': 1}
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

" indent line
" map <leader>il :IndentLinesToggle<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" ctrlp
let g:ctrlp_map = '<leader>j'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height=15
let g:ctrlp_max_files=100000
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.o,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ack
let g:ack_default_options = ' --ignore-dir=is:.ropeproject --ignore-file=ext:log --ignore-file=ext:csv --ignore-file=ext:out --ignore-file=ext:files --ignore-file=ext:a'
command! -bang -nargs=* -complete=file Ackpy call ack#Ack('grep<bang> --type=python', <q-args>)

" perforce
nnoremap <Leader>p4a :!p4 add %<CR>
nnoremap <Leader>ce :!p4 edit %<CR><CR>
nnoremap <Leader>p4d :!p4 diff %<CR>

" greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading --ignore-dir=is:.ropeproject --ignore-file=ext:log --ignore-file=ext:csv --ignore-file=ext:pyc'

" easygrep
let g:EasyGrepCommand=1
let g:EasyGrepFilesToExclude=".ropeproject,.idea,.git,.svn,*.log,*.csv,*.pyc"
let g:EasyGrepIgnoreCase=0

" less
nnoremap <Leader>m :w <BAR> call SaveLessToCss()<CR><space>
function! SaveLessToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !lessc -x " . current_file . " " . filename . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call SaveLessToCss()

" scss
function! SaveScssToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !scss " . current_file . " " . filename . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.scss call SaveScssToCss()

" easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" vim-go
