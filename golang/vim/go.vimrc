source $HOME/.vim/base.vimrc 

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>ds <Plug>(go-def-vertical)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>oi <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>v <Plug>(go-vet)
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"

" Syntastic with go
let g:syntastic_go_checkers = ['go', 'gotype', 'govet', 'golint', 'deadcode']
