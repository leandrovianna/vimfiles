"""""""""" OPÇÕES PARTICULARES PARA O EDITOR
set t_Co=256
syntax on
set number
set noai
set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoread
set wrap
set title
set mouse=c
set visualbell
set errorbells

" disable because I dont use Caps like Escape
" au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
" au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

""" colorscheme available
" see colorschemes.vim

colorscheme gruvbox
execute 'set background=' . (strftime('%H') >= 19 ? 'dark' : 'light')

"""""""""""" EasyMotion Configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Obs.: <Leader> is by default the '/' key
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
" set statusline+=%{SyntasticStatuslineFlag()}
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
nmap Ep "+p
" copy text from out of vim
vmap Ey "+y

command CopyAllFile :exe 'normal ggVG"+y'

" map <CapsLock> <Esc>

" open actual file in firefox brower
command OpenFirefox :exe ':silent !firefox %'
command OpenChrome :exe ':silent !google-chrome %'

"""""""""""" Vim Markdown
let g:vim_markdown_folding_disabled=1

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
	\ '(!inbox + !scheduled-'.strftime("%Y%m%d").')',
	\ '!todo @work',
	\ '!waiting @work',
	\ ]
