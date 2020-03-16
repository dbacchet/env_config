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
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator' " unified navigation key bindings between vim and tmux
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'   " multiple cursors like in sublime text
Plug 'tomtom/tcomment_vim'            " multi-language code comment utils
Plug 'tmsvg/pear-tree'                " automatic parens management
Plug 'junegunn/vim-easy-align'        " smart alignment macros
Plug 'matze/vim-move'                 " move blocks of code 
Plug 'rhysd/vim-clang-format'         " automatic code formattign
Plug 'tpope/vim-fugitive'             " git integration
Plug 'tpope/vim-surround'             " macros for surronding/changing text with tags/parens
Plug 'tpope/vim-dispatch'             " async jobs
Plug 'radenling/vim-dispatch-neovim'  " better integration of vim-dispatch and neovim
Plug 'majutsushi/tagbar'              " show a file outline in a pane
Plug 'schickling/vim-bufonly'         " close all buffers except the current
" select which completion engine (with LSP support) to use:
let use_coc = 0
let use_ncm2 = 0
if has('nvim') " only enable the heavy plugins with neovim
  if has('nvim') && executable('node') && 0 " CoC requiresrequires Node.js - KEEP IT DISABLED FOR NOW, UNTIL I FIGURE OUT THE UNDO PROBLEM (likely some combination of plugins)
    let use_coc = 1
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  else
    let use_ncm2 = 1
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
    Plug 'ncm2/ncm2-jedi'
  endif
endif
Plug 'ervandew/supertab'              " enable code completion pressing TAB
Plug 'mhinz/vim-startify'             " nice start screen with the list of the recently used files

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
set termguicolors
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

set clipboard=unnamedplus

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
if !has('nvim')
    set <A-h>=h
    set <A-j>=j
    set <A-k>=k
    set <A-l>=l
    " Ctrl-S to save
    inoremap <C-s> <esc>:w<CR>i
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
"use async make if vim-dispatch is installed
autocmd VimEnter * if exists(":Make") | exe "map <F5> :Make<CR><C-w><Up>" | exe "map <S-F5> :w <BAR> Make<CR><C-w><Up>" | endif

"""""""""""
" PLUGINS "
"""""""""""
let g:pear_tree_repeatable_expand = 0

" --- NERDTree ---
" Open/close NERDTree with ,t or F7
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>

" --- FuzzyFinder FZF ---
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

" --- vim-multiple-cursors ---
let g:multi_cursor_use_default_mapping=1
" let g:multi_cursor_start_key='<C-M>' " this will force a different keystroke to enter multi-cursor mode

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
if use_coc
  " nothing needed here for CoC; all the configuration is handled in
  " ~/.config/nvim/coc-settings.json
  let g:startify_custom_footer =
         \ ['', "   --- using CoC  ---  ", '']
elseif use_ncm2  
  " --- nvim completion manager ---
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " IMPORTANT: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  let g:cm_sources_override = {
      \ 'cm-tags': {'enable':0}
      \ }
  let g:cm_complete_start_delay = 50 " to improve response time while typing
  let g:cm_complete_popup_delay = 50 " default value
  " --- LanguageClient LSP ---
  let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd','--background-index=0','--header-insertion=never'],
  \ 'c':   ['clangd','--background-index=0','--header-insertion=never'],
  \ }
  " for python, use the ncm2-jedi plugin instead of the language server (disable the language client for python)
  call ncm2#override_source('LanguageClient_python', {'enable': 0})
  " mappings
  nmap <leader>c :call LanguageClient_contextMenu()<CR>
  set completefunc=LanguageClient#complete
  set formatexpr=LanguageClient_textDocument_rangeFormatting()
  let g:startify_custom_footer =
         \ ['', "   --- using ncm2  ---  ", '']
else
  let g:startify_custom_footer =
         \ ['', "   --- code-completion disabled ---  ", '']
endif
" --- SuperTab ---
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

" """""""""""""""""""" "
" small customizations "
" """""""""""""""""""" "

" custom filetype associations
autocmd BufNewFile,BufRead *.nionet  set filetype=yaml
autocmd BufNewFile,BufRead *.nnmsg   set filetype=yaml
" autocmd BufNewFile,BufRead *.h       set filetype=cpp

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
map <F2> :call TrimWhiteSpace()<CR>


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

