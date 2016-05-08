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
Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'molokai'
" Plugin 'Syntastic'
Plugin 'keith/swift.vim'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'

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

" tab insert 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" do not wrap lines by default
set nowrap

" set autoindent
" enable syntax highlighting and line numbers
syntax enable
set number
set relativenumber
set cursorline

" color scheme
set background=dark
let g:solarized_termcolors=   256
let g:solarized_termtrans =   0
let g:solarized_degrade   =   0
let g:solarized_bold      =   1
let g:solarized_underline =   1
let g:solarized_italic    =   0
let g:solarized_style     =   "dark"
let g:solarized_contrast  =   "normal"
colorscheme solarized

" current cursor position in lower right corner
set ruler
" incremental search
set incsearch
set hlsearch


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

" leader is comma
let mapleader=","

" jk and kj to escape
inoremap jk <esc>
inoremap kj <esc>

" :W to save
comman W w

" Ctrl-S to save
inoremap <C-s> <esc>:w<CR>i
nnoremap <C-s> :w<CR>
vnoremap <C-s> <esc>:w<CR>


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
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nmap <leader>bb :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>


""""""""""""
" QUICKFIX "
""""""""""""
map <F5> :make<CR><C-w><Up>
map <F6> :cn<CR>
map <F7> :cp<CR>


"""""""""""
" PLUGINS "
"""""""""""

" NERDTree
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" CtrlP
" map to ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" working dir mode (select as base the first parent containing .git, .svn, etc)
let g:ctrlp_working_path_mode = 'ra'
" exclude files/foldeets
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=1
" let g:multi_cursor_start_key='<C-M>' " this will force a different keystroke to enter multi-cursor mode

" Airline
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" " Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" NERDCommenter
" map C-/ to toggle-comment
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>gv
inoremap <C-_> <C-o>:call NERDComment(0,"toggle")<CR>
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>gv
inoremap <leader>/ <C-o>:call NERDComment(0,"toggle")<CR>

