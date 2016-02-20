set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" install other plugins
Plugin 'The-NERD-tree'
Plugin 'Solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'molokai'
Plugin 'Syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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

" set autoindent
" enable syntax highlighting and line numbers
syntax enable
set number
set relativenumber
set cursorline

" color scheme
set background=dark
" let g:solarized_termcolors=256
let g:solarized_termcolors=   256     
let g:solarized_termtrans =   0       
let g:solarized_degrade   =   0       
let g:solarized_bold      =   1       
let g:solarized_underline =   1       
let g:solarized_italic    =   0 
let g:solarized_style     =   "dark"  
let g:solarized_contrast  =   "normal"
colorscheme solarized
" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme molokai

" current cursor position in lower right corner
" set ruler
" incremental search
set incsearch
set hlsearch


set clipboard=unnamed
set nowrap

" visual autocomplete fot command menu
set wildmenu            

" leader is comma
let mapleader=","

" jk is escape
inoremap jk <esc>

""""""""""
" MOUSE  "
""""""""""

" enable mouse support in all modes
set mouse=a

" """""""" "
" KEYBOARD "
" """""""" "
" timeout used for key sequences to complete (in milliseconds)
set timeoutlen=100

set backspace=indent,eol,start

"""""""""""
" PLUGINS "
"""""""""""

" " NERDTree
" " open if no files in the command line
" " autocmd StdinReadPre * let s:std_in=1
" " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" " map to Ctrl+n
" map <C-n> :NERDTreeToggle<CR>
" " close if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

" Airline
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

