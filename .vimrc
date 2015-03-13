""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""" Vundle Configuration 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""" List of Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" L9 -- utility for programmers and some plugins needs it
Plugin 'L9'

" Vim-airline -- new status bar for vim
Plugin 'bling/vim-airline'

" ctrl-p -- Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'

" Syntastic -- syntax and errors checker for a lot of languages
Plugin 'scrooloose/syntastic'

" NERDTree -- very nice file browser
Plugin 'scrooloose/nerdtree'

" NERDTree Tabs -- NERDTree in all tabs 
Plugin 'jistr/vim-nerdtree-tabs'

" Vim Markdown support and align plugin tabular
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Vim Markdown Preview -- export a markdown file to html file
" Usage: :Me for preview / :Mer for refresh
Plugin 'waylan/vim-markdown-extra-preview'

" some yaml support
Plugin 'https://github.com/avakhov/vim-yaml.git'

" Vim Fugitive -- git tools for vim (see help)
Plugin 'tpope/vim-fugitive'

" Easymotion -- jump around in document using \w \j \k \s{character}
Plugin 'Lokaltog/vim-easymotion'

" Sparkup -- generate html elements with a simple notation (similiar to emmet)
Plugin 'rstacruz/sparkup'

" html5 auto complete simple
Plugin 'othree/html5.vim'

" js lint
Plugin 'hallettj/jslint.vim'

" css3 syntax
Plugin 'hail2u/vim-css3-syntax'

" CSSComb - css code organizer
" Usage: :CSScomb
Plugin 'git://github.com/miripiruni/CSScomb-for-Vim.git'

" jinja syntax highlighting
Plugin 'vim-scripts/Jinja'

" tComment -- comment and uncomment FAST 
" Usage: type gcc
Plugin 'tComment'

" Surround.vim -- surround text with htmls elements
Plugin 'surround.vim'

" Command-T - manage and open files fast
Plugin 'wincent/Command-T'

" Vim-Colorsque - Highlight Colors in CSS
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'

" vim-project -- projects for vim
Plugin 'amiorin/vim-project'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" OPÇÕES PARTICULARES PARA O EDITOR 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set noai
set t_Co=256
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set cul
" colorscheme badwolf
" set ruler
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" EasyMotion Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" use of w in easymotion
nmap <Leader>w <Plug>(easymotion-w)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>ss <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" Hotkeys de Navegação em Abas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Tab> gt
nmap <C-S-Tab> gT
nmap <S-l> gt
nmap <S-h> gT

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" NERDTree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map nt <plug>NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Markdown For HTML Generator Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indicando um folha de estilo para impressão
let b:VMEPstylesheet = '/home/leandro/.vim/print.css'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Syntastic Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" VIM-Arline Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set  laststatus=2 " vim-airline status bar shows everytime

""""""""""""""""""""""""""""""""""" vim-project config
let g:project_enable_welcome = 0
let g:project_use_nerdtree = 0
set rtp+=~/.vim/bundle/vim-project/
call project#rc()

source ~/.vimprojects
