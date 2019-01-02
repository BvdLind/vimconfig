" My Vimrc

let mapleader=" "
let maplocalleader=","

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'leafgarland/typescript-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'EinfachToll/DidYouMean'
Plugin 'w0rp/ale'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'
Plugin 'matze/vim-move'
Plugin 'junegunn/vim-easy-align'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'itmammoth/doorboy.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'airblade/vim-accent'

" Color Themes
Plugin 'ayu-theme/ayu-vim'
"Plugin 'ajh17/spacegray.vim'
"Plugin 'dracula/vim'
"Plugin 'joshdick/onedark.vim'
"Plugin 'morhetz/gruvbox'
"Plugin 'tomasr/molokai'
"Plugin 'jacoborus/tender.vim'
"Plugin 'arcticicestudio/nord-vim'
"Plugin 'yuttie/hydrangea-vim'
"Plugin 'tyrannicaltoucan/vim-deep-space'

call vundle#end()
filetype plugin on

"Workaround for backspace problem
imap ^H <Left><Del>

" Basic stuff
syntax on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set autoindent
set textwidth=80
set smartindent
set number
set relativenumber
set nocompatible
set encoding=utf-8
set laststatus=2
set showmode
set showcmd
set showmatch
set nowrap
set pastetoggle=<f2>
set history=1000
set ttyfast
set mouse=a
set magic
set noshowmode
set foldmethod=manual
set background=dark


" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Spelling
map <F6> :setlocal spell! spelllang=en<CR>
map <F7> :set spelllang=nl<CR>

autocmd BufWritePre * %s/\s\+$//e " Automatically deletes trailing whitespace

" Smart mappings command mode
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Splitting and movement between splits
set splitbelow splitright
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Split sizing
nnoremap <silent> <leader>> :5winc <<CR>
nnoremap <silent> <leader>< :5winc ><CR>
nnoremap <silent> <leader>+ :5winc +<CR>
nnoremap <silent> <leader>_ :5winc -<CR>
nnoremap <silent> <leader>= <C-W>=<CR>

" Copy selected text to system clipboard
vnoremap <C-c> "+y
map <C-p> "+P

" Toggle wrap
nnoremap <leader>WT :set wrap!<CR>

" Fix missing syntax highlighting ts files
au BufRead,BufNewFile *.ts   setfiletype typescript

" Format on save with prettier
let g:prettier#autoformat = 1
let g:prettier#config#single_quote = 'true'

" Latex
map <leader>co :!pdflatex % && start %:r.pdf<CR>
map <leader>x :!xelatex % && start %:r.pdf<CR>
let g:livepreview_previewer = 'mupdf'

" Open current file in chrome
map <leader>cr :!chrome %<CR>

" Run live-server for current file
map <leader>l :!live-server %<CR>

" Netrw
let g:netrw_banner = 0 " Disable banner
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist
let g:netrw_liststyle = 3 "Open in prior window
let g:netrw_browse_split = 4 "Open splits to the right
let g:netrw_altv = 1
let g:netrw_winsize = 20

" CtrlP fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_map = '<leader>P'
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.git|_site|dist|node_modules)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'some_bad_symbolic_links',
   \ }

" Access my vimrc mappings
nnoremap <leader>sev :vsplit $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :w<CR> :so $MYVIMRC<CR>

" Abbreviations
iab @@ bvanderlinden1@gmail.com
iab ccopy copyright 2018 Bas van der Linden, all rights reserved.
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel " Surround with double quotes

set directory^=$HOME/.vim/tmp// " Swap files are stored here

set statusline=%f\ -\ FileType:\ %y

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu


if !has("gui_running")
  if !has("nvim")
    set term=xterm
  endif
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

"set shortmess+=I  " hide the launch screen (startify deals with this already)

" Remapping backaspace behavior because of xterm
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

" Kill window
nnoremap K :q<cr>

" Man
nnoremap M K

" Toggle line numbers and relative line numbers
nnoremap <leader>n :setlocal number!<cr> :setlocal relativenumber!<cr>

" Yank to end of line
nnoremap Y y$

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Open current directory in Finder
nnoremap <leader>O :!explorer .<cr>

" Easy way to open file
nnoremap <leader>e :e<Space>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type motions
noremap H ^
noremap L $
vnoremap L g_

" Map ; to : for fewer keystrokes
nnoremap ; :
vmap ; :
nmap <silent> <leader>/ :nohlsearch<CR>

" Easier saving
map F :w!<CR>
imap  <esc>:w!<CR>i

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Fugitive mappings
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>gaa :Git add .<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Git checkout<Space>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gmv :Gmove<Space>
nnoremap <leader>gr :Gremove<cr>

" vim surround
map <leader>S ySiw
map <leader>s ysiw

" Ack vim mappings
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>A :Ack! <C-r><C-w><CR>
nnoremap <leader>ar :cdo s/

" qq to record, Q to replay
nnoremap Q @q

" Easymotion
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" Vim tabs shortcuts
nnoremap <leader>tp  :tabprev<CR>
nnoremap <leader>tn  :tabnext<CR>
nnoremap <leader>te  :tabedit<Space>
nnoremap <leader>tc  :tabclose<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Delete current file in buffer
nnoremap <leader>r :call delete(expand('%')) \| bdelete!<CR>

" Quitting and discarding
nnoremap <leader>X :q!<CR>
nnoremap <leader>Q :qall<CR>

" Clear search registry
nnoremap <silent> <leader>/ :nohlsearch<CR>"

" Pull word under cursor into LHS of a substitute (for quick search and replace)
nnoremap <Localleader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Indent lines with a single '<' or '>'
nnoremap > >>_
nnoremap < <<_

" Wanting to press escape but pressing <F1>
nmap <F1> <Esc>
imap <F1> <ESC>

" Shell inside vim
noremap <silent> Z :suspend<CR>
"set shell=C:\tools\Cmder\vendor\git-for-windows\bin\bash.exe
tnoremap <C-W>h <C-\><C-n><C-w>h
tnoremap <C-W>j <C-\><C-n><C-w>j
tnoremap <C-W>k <C-\><C-n><C-w>k
tnoremap <C-W>l <C-\><C-n><C-w>l

" Escaping with j;
inoremap j; <Esc>
xnoremap j; <Esc>
cnoremap j; <C-c>

" Redraw screen mapping
nnoremap <leader>r :redraw!<CR>

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'typescript': ['tslint'],
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '%linter% says %s %code%[%severity%]'
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 100   " millisecs
nmap <silent> <C-K> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)
nmap <Localleader>f <Plug>(ale_fix)

let g:doorboy_additional_brackets = {
  \ 'html': ['<>']
  \ }

map <leader>at :ALEToggle<CR>

nmap <leader>i :Zeavim!<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Goyo mapping
nnoremap <leader>G :Goyo<CR>

" Lightline config
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [
\       ['mode', 'paste'], ['readonly', 'relativepath', 'modified']
\   ],
\   'right': [
\       ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'],
\       ['gitbranch']
\   ]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head',
\ }
\ }

" vim-move modifier key
let g:move_key_modifier = 'C'

" Location to zeal executable
let g:zv_zeal_executable = has('win32')
\ ? 'C:\Program Files' . '\Zeal\zeal.exe'
\ : 'zeal'

" Function to get list of commits to be used in startify list
function! s:list_commits()
  let git = 'git -C C:'
  let commits = systemlist(git .' log --oneline | head -n10')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" Startify
let g:startify_bookmarks=[
\ '~/.vimrc',
\ '~/.vim/plugins.vim',
\]
" A list of Vim regular expressions that filters recently used files
let g:startify_skiplist=[
\ 'COMMIT_EDITMSG',
\ $VIMRUNTIME .'/doc',
\ 'plugged/.*/doc',
\ 'bundle/.*/doc',
\]
let g:startify_custom_header = ""
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent files']            },
      \ { 'type': 'dir',       'header': ['   Recent files in working directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': function('s:list_commits'), 'header': ['   Commits']      },
      \ ]
"let g:startify_custom_header = [
"\' __/\\\________/\\\___/\\\\\\\\\\\___/\\\\____________/\\\\_        ',
"\'  _\/\\\_______\/\\\__\/////\\\///___\/\\\\\\________/\\\\\\_       ',
"\'   _\//\\\______/\\\_______\/\\\______\/\\\//\\\____/\\\//\\\_      ',
"\'    __\//\\\____/\\\________\/\\\______\/\\\\///\\\/\\\/_\/\\\_     ',
"\'     ___\//\\\__/\\\_________\/\\\______\/\\\__\///\\\/___\/\\\_    ',
"\'      ____\//\\\/\\\__________\/\\\______\/\\\____\///_____\/\\\_   ',
"\'       _____\//\\\\\___________\/\\\______\/\\\_____________\/\\\_  ',
"\'        ______\//\\\_________/\\\\\\\\\\\__\/\\\_____________\/\\\_ ',
"\'         _______\///_________\///////////___\///______________\///__',
"\ ]