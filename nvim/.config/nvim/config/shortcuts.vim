" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap <leader>p "+p

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Behave vim 
nnoremap Y y$

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" remap esc to use noh
nnoremap <ESC> :noh<CR>

" mapping to move lines
inoremap <C-h> <esc>:m .+1<CR>==
inoremap <C-t> <esc>:m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==

" Shortcutting split navigation, saving a keypress:
map <C-d> <C-w>h
map <C-h> <C-w>j
map <C-t> <C-w>k
map <C-n> <C-w>l

nnoremap ZA :wqa!<CR>
