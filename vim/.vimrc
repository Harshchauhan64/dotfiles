" Check if vim-plug is installed, if not, download and install it
if empty(glob('~/.vim/autoload/plug.vim'))
    " Download vim-plug silently
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " Install plugins automatically on first run
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Begin the plugin section
call plug#begin('~/.vim/plugged')
" List of plugins to install
Plug 'dense-analysis/ale'           " Asynchronous Lint Engine
Plug 'fehawen/sc.vim'               " Colorscheme plugin
Plug 'fehawen/sl.vim'               " Status line plugin
Plug 'terryma/vim-expand-region'    " Visually select increasingly larger regions
Plug 'tpope/vim-commentary'         " Comment stuff out
call plug#end()

" Uncomment these lines to disable bold mode and set terminal colors
"Disables bold mode
"https://vimhelp.org/term.txt.html
" set t_md=
" set t_ZH=
" Must come before 'syntax on'
" https://vimdoc.sourceforge.net/htmldoc/syntax.html#xterm-color
" set t_Co=8

" Enable syntax highlighting
syntax on
" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Set various options
set clipboard=unnamedplus           " Use system clipboard
set showmatch                       " Show matching brackets
set cursorline                      " Highlight current line
set wildmenu                        " Enhanced command-line completion
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode
set breakindent                     " Preserve indentation in wrapped lines
set hlsearch                        " Highlight search results
set incsearch                       " Incremental search
set ignorecase                      " Ignore case in search patterns
set smartcase                       " Override ignorecase if search pattern has uppercase
set number                          " Show line numbers
set relativenumber                  " Show relative line numbers
set tabstop=4                       " Number of spaces a tab counts for
set shiftwidth=4                    " Number of spaces to use for autoindent
set expandtab                       " Use spaces instead of tabs
set noswapfile                      " Disable swap file
set nobackup                        " Disable backup file
set list                            " Show hidden characters
"set fillchars=vert:│,fold:┄,diff:╱  " Set characters for various UI elements
"set listchars=tab:⋮\ ,trail:⎵   " Set characters for tabs and trailing spaces
"set showbreak=↪                     " Set character for line breaks

" ALE (Asynchronous Lint Engine) settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1

" Uncomment to hide syntax item and file type in status line
"let g:sl_hide_syntax_item = 1
"let g:sl_hide_file_type = 1

" Set colorscheme
"colorscheme sc

" Auto-commands
au VimResized * wincmd=                 " Automatically resize splits when vim is resized
au BufWritePre * %s/\s\+$//e            " Remove trailing whitespace on save
au StdinReadPre * let s:std_in=1        " Check if vim was started with a file argument
" Highlight column 73 for Python, 81 for other filetypes
au WinEnter,BufEnter * call matchadd('ColorColumn', &ft == 'python' ? '\%73v' : '\%81v', 100)
au WinLeave,BufLeave * call clearmatches()

" Key mappings
vmap v <Plug>(expand_region_expand)     " Expand visual selection
vmap <C-v> <Plug>(expand_region_shrink) " Shrink visual selection
map <C-n> :Lexplore<CR>                 " Open file explorer
vmap <BS> <gv                           " Unindent in visual mode
vmap <TAB> >gv                          " Indent in visual mode
map <C-s> :vert ter<CR>                 " Open vertical terminal
nmap <silent> <C-k> <Plug>(ale_previous_wrap)  " Go to previous ALE error
nmap <silent> <C-j> <Plug>(ale_next_wrap)      " Go to next ALE error
nmap <silent> <C-h> :ALEHover<CR>              " Show ALE hover information
nnoremap <silent> gt :ALEGoToDefinition<CR>    " Go to definition
nnoremap <silent> gr :ALEFindReferences<CR>    " Find references
map <C-Tab> :noh<CR>                    " Clear search highlighting
nnoremap <S-Tab> :bp<CR>                " Go to previous buffer
nnoremap <Tab> :bn<CR>                  " Go to next buffer
tnoremap <Esc> <C-\><C-n>               " Exit terminal mode with Esc

" Netrw (built-in file explorer) settings
let g:netrw_liststyle = 3               " Tree view
let g:netrw_banner = 0                  " Remove banner
let g:netrw_browse_split = 4            " Open in previous window
let g:netrw_altv = 1                    " Open splits to the right
let g:netrw_winsize = 25                " Set width of explorer to 25% of screen
