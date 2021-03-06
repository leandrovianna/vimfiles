"""""""""" OPÇÕES PARTICULARES PARA O EDITOR
set t_Co=256
syntax on
set number
set noai
set autoindent
set copyindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set autoread
set nowrap
set title
set mouse=c
set visualbell
set errorbells

au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

""" colorscheme available
" see colorschemes.vim

colorscheme vividchalk

let mapleader=','

"""""""""""" EasyMotion Configuration
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

""""""""""""""" Hotkeys de Navegação em Abas
nmap <S-Tab> gt
nmap <C-S-Tab> gT
nmap <S-l> gt
nmap <S-h> gT

"""""""""""""" VIM-Arline Config
set laststatus=2 " vim-airline status bar shows everytime
" custom the status bar with Syntastic e Fugitive
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%*

"""""""""""" Hotkeys para janelas no Vim
" divide a janela horizontalmente
" nmap <C-w>h <C-w>s
" divide a janela verticalmente
" nmap <C-w>v <C-w>v
" command VW vs
" command HW sp

"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" paste text from out of vim
nmap <Leader>p "+p
" copy text from out of vim
vmap <Leader>y "+y

command CopyAllFile :exe 'normal ggVG"+y'

" open actual file in firefox brower
command OpenFirefox :exe ':silent !firefox %'
command OpenChrome :exe ':silent !google-chrome %'

"""""""""""" Vim Markdown
let g:vim_markdown_folding_disabled=1

"""""""""""" Vim Markdown Preview
let vim_markdown_preview_github=1

"""""""""""" UltiSnips
let g:UltiSnipsEditSplit="context"

" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""" VERun
let w:VEGppArgs="-g -Wall -Wextra -Werror -Wfloat-equal -Winit-self"
let w:VETerm="x-terminal-emulator -e"
""""""""""""""""""""""

" open and explore folder
fun CdEx(path)
	exe ':Explore '. a:path
	exe ':cd %:p:h'
	exe ':pwd'
endfun

" define a command to use CdEx
command -nargs=1 -complete=file CdEx call CdEx(<f-args>)

" generate random numbers
fun Random(min, max)
	exe ':py3 import random, vim'
	exe ':py3 vim.current.line += str(random.randint('. a:min .','. a:max .'+1))'
endfun

command -nargs=* Random call Random(<f-args>)

""" Neomake configs
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)

" neomake maker for project with Makefile
let g:neomake_make_maker = {
			\ 'exe': 'make',
			\ 'args': '',
			\ 'errorformat': '%f:%l:%c: %m',
			\ }

let g:neomake_enabled_makers = ['make']

" let g:neomake_cpp_enabled_makers = ['make', 'gcc']
" let g:neomake_go_enabled_makers = ['']

" change error and warning signs
let g:neomake_warning_sign = {
			\ 'text': 'W',
			\ 'texthl': 'WarningMsg',
			\ }
let g:neomake_error_sign = {
			\ 'text': 'E',
			\ 'texthl': 'ErrorMsg',
			\ }

let g:neomake_logfile = '/tmp/neomake.log'

""""""""""""""""""""""""""""""

" gtd.vim config
let g:gtd#dir = '~/notes'

let g:gtd#review = [
			\ '!inbox',
			\ '-!done',
			\ '!todo @work',
			\ '!waiting @work',
			\ ]

" removing trailing spaces

function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

" register when save file to removing trailing spaces
" autocmd FileType json,lua,vim,c,cpp,php,ruby,python,javascript,typescript,java,golang,dart,markdown autocmd BufWritePre <buffer> :call TrimWhiteSpace()
autocmd FileType * autocmd BufWritePre <buffer> :call TrimWhiteSpace()

" vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <Leader>b :buffers<CR>

""" Indentation file-specific options
autocmd Filetype cpp,c setlocal ts=4 sw=4 expandtab
autocmd Filetype typescript,javascript,html,css setlocal ts=2 sw=2 expandtab

""" Format json files
com! FormatJSON !python -m json.tool
