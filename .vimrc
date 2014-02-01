" Reload ~/.vimrc after write
autocmd!
autocmd BufWritePost ~/.vimrc so ~/.vimrc


" GENERAL
" --------------------------------------------------------------------------

let mapleader = ","                     " Use , as leader
set hidden                              " Hide abandoned buffer (no unload)


" COMMAND LINE
" --------------------------------------------------------------------------

set wildmenu                            " Enhanced command-line completion
set wildmode=list:longest               " - List all matches
set wildignore+=.git,node_modules       " - Ignore folders in completion

" Browse command history with <c-j/k>
cmap <c-j> <down>
cmap <c-k> <up>


" UI
" --------------------------------------------------------------------------

set number                              " Show line numbers
set numberwidth=4                       " Use 4 character wide line numbers
set ruler                               " Show ruler
set t_Co=256                            " Use 256 colors
set background=dark                     " Background color
set showmatch                           " Show matching bracket
set linebreak                           " Use word-wrapping

syntax on                               " Enable syntax highlighting


" NAVIGATION
" --------------------------------------------------------------------------

set smartcase                           " Match all for lowercase pattern
set incsearch                           " Incremental search while typing
set scrolloff=10                        " Lines above/below cursor

" Move up/down into wrapped lines
nnoremap j gj
nnoremap k gk

" Goto tab using <leader>1..9
for i in [1,2,3,4,5,6,7,8,9]
  exec "map <leader>" . i . " :normal " . i . "gt<cr>"
endfor


" EDITING
" --------------------------------------------------------------------------

set autoindent                          " Copy indent when starting new line
set smartindent                         " Add indent, i.e. on line after {
set encoding=utf-8                      " Use utf-8 encoding
set softtabstop=2                       " Make a tab correspond to 2 spaces
set shiftwidth=2                        " Make indents 2 spaces
set shiftround                          " Round indents to multiple of shiftwidth
set expandtab                           " Insert spaces instead of tabs

" Move line(s) up/down
nnoremap <c-k> mz:m-2<cr>`z
nnoremap <c-j> mz:m+<cr>`z
vnoremap <c-k> :m'<-2<cr>`>my`<mzgv`yo`z
vnoremap <c-j> :m'>+<cr>`<my`>mzgv`yo`z

" Don't exit visual mode when shifting
vnoremap < <gv2h
vnoremap > >gv2l

" Remove trailing spaces before save
autocmd BufWritePre * :%s/\s\+$//e

" Toggle paste mode
noremap <f4> :setlocal paste!<cr>

" Write buffer using <leader>w
nnoremap <leader>w :w<cr>
vnoremap <leader>w <esc>:w<cr>
inoremap <leader>w <esc>:w<cr>

" Replace word under cursor
nnoremap <leader>r :%s/\<<c-r><c-w>\>/


" VUNDLE CONFIGURATION
" --------------------------------------------------------------------------

filetype off                            " Disable filetype detection
set runtimepath+=~/.vim/bundle/vundle/  " Add Vundle path to run time path
call vundle#rc()                        " Load Vundle

" Configure Vundle itself
Bundle 'gmarik/vundle'

" Configure other bundles
Bundle 'kien/ctrlp.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'xptemplate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'

filetype plugin indent on               " Re-enable filetype detection


" BUNDLES CONFIGURATION
" --------------------------------------------------------------------------

let g:ctrlp_working_path_mode = 0       " Dont't manage working directory
let g:xptemplate_key = '<Tab>'          " Use tab to expand templates
