set nocompatible              " be iMproved, required


" """""" "
" Vundle "
" """""" "
"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" other plugin
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'keith/swift.vim'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'matze/vim-move'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'neomake/neomake'
Plugin 'dcharbon/vim-flatbuffers'
Plugin 'rhysd/vim-clang-format'
" Plugin 'Syntastic'
" Plugin 'tpope/vim-dispatch'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""
" EDITOR "
""""""""""

" do not create the fname~ backup
set nobackup
" place swap files in a common dir (double // at the end to avoid name collisions)
if !isdirectory($HOME.'/.vim/swp')
    call mkdir($HOME.'/.vim/swp', 'p')
endif
set directory=~/.vim/swp//
" set backupdir=~/.vim/tmp/backup_files//
" set undodir=~/.vim/tmp/undo_files//

" tab insert 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" do not wrap lines by default
set nowrap

" set autoindent
" customize indentation for c/c++: [don't indent namespaces],[don't indent
" scopes (public/protected/private)]
set cino=N-s,g0
" enable syntax highlighting and line numbers
syntax enable
set number
set relativenumber
set cursorline
" color column at specified width
set colorcolumn=120

" color scheme
set background=dark
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 0
let g:solarized_degrade    = 0
let g:solarized_bold       = 1
let g:solarized_underline  = 1
let g:solarized_italic     = 0
let g:solarized_style      = "dark"
let g:solarized_contrast   = "normal"
colorscheme solarized

" disable Background Color Erase for xterm-like terminals (even inside tmux)
set t_ut=
" increase the scrolling performance by buffering movements
set lazyredraw
set ttyfast

" current cursor position in lower right corner
set ruler
" incremental search
set incsearch
set hlsearch
" smartcase when searching
set ignorecase
set smartcase
" hit CR in normal mode to clear the search highlights
nnoremap <silent> <CR> :noh<CR><CR>

set clipboard=unnamed

" visual autocomplete for command menu
set wildmenu
" more natural split new placement (on right and below)
set splitbelow
set splitright

""""""""""
" MOUSE  "
""""""""""

" enable mouse support in all modes
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" """""""" "
" KEYBOARD "
" """""""" "
" timeout used for key sequences to complete (in milliseconds)
set timeoutlen=500
" ttimeout is used for single keystrokes (in milliseconds)
set ttimeoutlen=10


set backspace=indent,eol,start

" semicolon to behave like :
nnoremap ; :

" leader is comma
let mapleader=","

" jk and kj to escape
inoremap jk <esc>
inoremap kj <esc>

" :W to save and :Q to quit (common typos I make...)
comman W w
comman Q q

" check for file chenges after 4s (checktime default val) of inactivity in normal mode
set autoread
" au CursorHold * checktime

" Ctrl-S to save
inoremap <C-s> <esc>:w<CR>i
nnoremap <C-s> :w<CR>
vnoremap <C-s> <esc>:w<CR>

" remapping for the keys that are used with the Alt modifier on terminal vim
" (editor must be configured to send Esc+key when Alt is pressed)
if !has('nvim')
    set <A-h>=h
    set <A-j>=j
    set <A-k>=k
    set <A-l>=l
endif

" " resize panes with C-S-<movement keys>
" nmap 6 :resize +2<CR>
" nmap 7 :resize -2<CR>
" nmap 8 :vertical resize +2<CR>
" nmap 9 :vertical resize -2<CR>

" """"""""""""
" TABS/BUFFERS "
" """"""""""""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <A-l> :bnext<CR>
imap <A-l> <ESC>:bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <A-h> :bprevious<CR>
imap <A-h> <ESC>:bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nnoremap <leader>bb :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" show current buffer in NERDTree
nnoremap <leader>bf :NERDTreeFind<CR>


""""""""""""
" QUICKFIX "
""""""""""""
map <F5> :make<CR><C-w><Up>
map <S-F5> :w <BAR> make<CR><C-w><Up>
map <F4> :cn<CR>
map <S-F4> :cp<CR>


"""""""""""
" PLUGINS "
"""""""""""

" NERDTree
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with ,t or F7
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <F7> :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" CtrlP
" map to ctrl-P
let g:ctrlp_map                = '<c-p>'
let g:ctrlp_cmd                = 'CtrlP'
" working dir mode (select as base the first parent containing .git, .svn, etc)
let g:ctrlp_working_path_mode  = 'ra'
" exclude files/folders
set wildignore+=*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_custom_ignore      = '\v[\/]\.(git|hg|svn)$'
" recursive scan parameters
let g:ctrlp_max_files          = 100000
" use Ag instead of grep and as scanner engine in CtrlP
if executable("ag")
    " Ag already ignores patterns in .gitignore; adding also *.o and cmake-generated .dir
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore "*.o" --ignore "*.dir" -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" " Unite.vim
" nnoremap <C-p> :Unite file_rec/async<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=1
" let g:multi_cursor_start_key='<C-M>' " this will force a different keystroke to enter multi-cursor mode

" Airline
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tcomment
" I need to find a better configuration to provide a more consistent approach
nmap <leader>/ gc
xmap <leader>/ gcgv

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" TagBar
nmap <F8> :TagbarToggle<CR>

" custom filetype associations
autocmd BufNewFile,BufRead *.nionet  set filetype=yaml
autocmd BufNewFile,BufRead *.nnmsg   set filetype=yaml

" """""""""""""""""""" "
" small customizations "
" """""""""""""""""""" "

" quick function for switching header/source, using ctags
" tags must be generated using the following cmdline: ctags -R --extra=+f <DIR>
function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cpp")
    execute "tag " . expand("%:t:r") . ".h"
  else
    execute "tag " . expand("%:t:r") . ".cpp"
  endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
map <F2> :call TrimWhiteSpace()<CR>
