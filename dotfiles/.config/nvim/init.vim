" -----------------------------------------------------------------------------

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" -- PLUGINS/SETTINGS ---------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" better statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" allows use of vifm as a file picker
    Plug 'vifm/vifm.vim'

" a code-completion engine for Vim
    Plug 'valloric/youcompleteme'

" automatic keyboard layout switching in insert mode
    Plug 'lyokha/vim-xkbswitch'

" makes text more readable
    Plug 'junegunn/goyo.vim'

" simple tool to paste images into markdown files
    Plug 'ferrine/md-img-paste.vim'

call plug#end()

" Airline theme
    let g:airline_theme='base16_bright'
    let g:airline_powerline_fonts = 1
    let g:Powerline_symbols='unicode'

" Vertical Split & Explore
    map <silent> <F10> :Vexplore<CR>

" Activate xkbswitch
    let g:XkbSwitchEnabled = 1

" Toggle Goyo (F8 key)
    map <silent> <F8> :Goyo<CR>

" Markdown image paste
    autocmd FileType markdown nmap <silent> <F4> :call mdip#MarkdownClipboardImage()<CR>
    " there are some defaults for image directory and image name, you can change them
    let g:mdip_imgdir = 'img'
    let g:mdip_imgname = 'image'

" -- GENERAL ------------------------------------------------------------------

" Basic
    set ignorecase
	set laststatus=2
	set encoding=utf-8
	set hlsearch
	set mouse=a
	set colorcolumn=80
	set wrap
	set number relativenumber
    set history=10000
    "set formatoptions+=t
	set clipboard+=unnamedplus
    colorscheme torte
	let mapleader=","
	syntax on

" Spaces & Tabs
	set tabstop=4       " number of visual spaces per TAB
	set softtabstop=4   " number of spaces in tab when editing
	set shiftwidth=4    " number of spaces to use for autoindent
	set expandtab       " tabs are space
    set autoindent
    set copyindent      " copy indent from the previous line

" -- OTHERS -------------------------------------------------------------------

" Automatic word wrapping textwidth
    map <F5> :set textwidth=79<CR>
    map <S-F5> : set textwidth=0<CR>

" Toggle word wrap. Change how text is displayed.
    map  <F6> :set nowrap!<CR>

" Toggle spell-check (F7 key)
    map  <F7> :setlocal spell! spelllang=en,ru<CR>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Compile dwm when changed
    autocmd BufWritePost config.h !sudo make clean install
