"bassic settings
set number
set smartcase
set nobackup
set noswapfile
set showcmd

" instead of changing / to space, do this as it will show up in showcmd 
map <space> <leader>
"
" " use leadern and leaderp for lnext/lprev
nmap <leader>n :lnext<cr>
nmap <leader>p :lprev<cr>
"
"training wheels
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"
""enter & shift-enter in normal mode act like o/O without entering insert mode
nmap <leader>o  O<Esc>j
nmap <CR> o<Esc>k

set pastetoggle=<leader>p

"color settings
syntax on

"spelling shows up
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellCap cterm=underline ctermbg=none

"y and p from clipbaord
set clipboard=unnamed
"
""statusline
set statusline+=%y      "filetype

" Show lots of characters for whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
noremap <leader>w :set list!<CR>
"
" " open files from current directory
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
