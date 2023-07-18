set nocompatible              " be iMproved, required

" """""""" "
" Vim-Plug "
" """""""" "
"
" automatically download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sheerun/vim-polyglot'           " language packs
Plug 'christoomey/vim-tmux-navigator' " unified navigation key bindings between vim and tmux
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple cursors
Plug 'tomtom/tcomment_vim'            " multi-language code comment utils
Plug 'tmsvg/pear-tree'                " automatic parens management
Plug 'junegunn/vim-easy-align'        " smart alignment macros
Plug 'matze/vim-move'                 " move blocks of code 
Plug 'rhysd/vim-clang-format'         " automatic code formattign
Plug 'tpope/vim-fugitive'             " git integration
Plug 'tpope/vim-surround'             " macros for surronding/changing text with tags/parens
" Plug 'majutsushi/tagbar'              " show a file outline in a pane
" Plug 'schickling/vim-bufonly'         " close all buffers except the current
Plug 'mbbill/undotree'                " visual tree with all the undo/redo branches
Plug 'mhinz/vim-startify'             " nice start screen with the list of the recently used files
" Markdown live preview (prebuilt version)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" completion engines only used in neovim
let use_cmp = 0
if has("nvim")
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  
  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  let use_cmp = 1
endif

" Brief help
" :PlugInstall [name ...] [#threads] Install plugins
" :PlugUpdate [name ...] [#threads]	 Install or update plugins
" :PlugClean[!]	                     Remove unused directories (bang version will clean without prompt)
" :PlugUpgrade	                     Upgrade vim-plug itself
" :PlugStatus	                     Check the status of plugins

" All plugins must be added before the following line
call plug#end()


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
if exists('+termguicolors')
    " needed for true color in regular vim under tmux (see: https://github.com/tmux/tmux/issues/1246)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set background=dark
let g:neodark#background = '#202020'
colorscheme neodark

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
if has('nvim')
  set inccommand=nosplit " live search/replace
endif
" hit CR in normal mode to clear the search highlights
nnoremap <silent> <CR> :noh<CR><CR>

" leader is comma
let mapleader=","

" using clipboard=unnamedplus in neovim is very slow because every event (potentially every keystroke like 
" repeating 'x' in normal mode) will invoke an external process (i.e. 'pbcopy') through the clipboard provider.
" To prevent this we use the default vim clipboard while editing, and mapped <leader>x/y/p to work with the system clipboard
" set clipboard=unnamedplus <-- with nvim this 
nnoremap <leader>x "+x
vnoremap <leader>x "+x
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
vnoremap <leader>p "+gp
nnoremap <leader>P "+gP
vnoremap <leader>P "+gP

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
" if &term =~ '^screen'
"     " tmux knows the extended mouse mode
"     set ttymouse=xterm2
" endif

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

" jk and kj to escape
inoremap jk <esc>
inoremap kj <esc>

" :W to save and :Q to quit (common typos I make...)
comman W w
comman Q q

" check for file changes after 4s (checktime default val) of inactivity in normal mode
set autoread
" au CursorHold * checktime

" remapping for the keys that are used with the Alt modifier on terminal vim
" (editor must be configured to send Esc+key when Alt is pressed)
if has('nvim')
    " Ctrl-S to save
    inoremap <C-s> <esc>:w<CR>gi
    nnoremap <C-s> :w<CR>
    vnoremap <C-s> <esc>:w<CR>
endif

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
nnoremap <leader>bb :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" show current buffer in NERDTree
nnoremap <leader>bf :NERDTreeFind<CR>


"""""""""""
" PLUGINS "
"""""""""""
" pear-tree
let g:pear_tree_repeatable_expand = 0

" --- NERDTree ---
" Open/close NERDTree with ,t or F7
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>

" --- FuzzyFinder FZF ---
if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files --smart-case' " use ripgrep for fzf if is installed
endif
" Ctrl-P to search for files
nmap <C-p> :FZF<CR>
" Ctrl-B to search for open buffers
nmap <C-b> :Buffers<CR>
" actions on the FZF selected file/buffer/etc
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" --- vim-visual-multi ---
let g:VM_theme = 'spacegray' " more visible highlights

" --- Airline --- (also used by lightline)
" always show statusline
set laststatus=2
let g:airline_extensions = ['tabline'] " only a minimal set of extensions, to reduce the startup time and improve performance
let g:airline_powerline_fonts = 1
let g:buftabline_indicators = 1

" --- Startify ---
" only show the most recent files in the current dir
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ ]
let g:startify_change_to_dir = 0 " do not change to file dir on open 

" --- Code Completion ---
" to force 1 column in the vim gutter for the linter signs
set signcolumn=yes
if use_cmp  
  let g:startify_custom_footer =
         \ ['', "   --- using vim-cmp  ---  ", '']
else
  let g:startify_custom_footer =
         \ ['', "   --- code-completion disabled ---  ", '']
endif

" tcomment
" disable default mappings and only map the minimum
let g:tcomment_maps = 0
nnoremap <C-_><C-_> :TComment<CR>
vnoremap <C-_><C-_> :TComment<CR>gv

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

 
" UndoTree
map <F6> :UndotreeToggle<CR>

" """""""""""""""""""" "
"    Neovim specific   "
" """""""""""""""""""" "
if has("nvim")
  runtime completion.lua
endif

" """""""""""""""""""" "
" small customizations "
" """""""""""""""""""" "

" custom filetype associations
" autocmd BufNewFile,BufRead *.h       set filetype=cpp

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
map <F2> :call TrimWhiteSpace()<CR>

" Toggle LanguageClient
if has("nvim")
    function ToggleLanguageClient()
        if g:LanguageClientEnabled
            LspStop
            let g:LanguageClientEnabled = 0
        else
            LspStart
            let g:LanguageClientEnabled = 1
      endif
    endfunction
    let g:LanguageClientEnabled = 1
    map <F3> :call ToggleLanguageClient()<CR>
endif

" """" "
" misc "
" """" "

" --- to profile vim itself, use the following:
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!

