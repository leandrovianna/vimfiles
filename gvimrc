set guifont=Fantasque\ Sans\ Mono\ 13

colorscheme gruvbox
execute 'set background=' . (strftime('%H') >= 19 ? 'dark' : 'light')
