set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sleuth'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

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

colorscheme desert
set path=$PWD/**

if has('gui_running')
	set guifont=Inconsolata\ for\ Powerline\ 12
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

" YouCompleteMe configuration
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_whitelist = {
	\ 'cpp': 1,
	\ 'python' : 1 }
let g:ycm_error_symbol = '*'

" Airline configuration
set laststatus=2   " Always show the statusline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'murmur'

syntax enable
set number
set nowrap
set tabstop=4
set autoread
highlight Pmenu guibg=brown gui=bold

autocmd BufWritePost *.cpp,*.hpp,*.c,*.h !cppcheck % && vera++ %

map <C-Down> :bprevious<CR>
map <C-Up> :bnext<CR>
map <C-m> :bdelete<CR>

map <C-t> :NERDTree .<CR>

map <F7> :!mmake -j`nproc`<CR>
map <F8> :!mmake clean<CR>
map <F9> :!mmake utest<CR>
map <F10> :!mmake utest clean<CR>
map <F11> :!mmake mtest<CR>
map <F12> :!mmake mtest clean<CR>

