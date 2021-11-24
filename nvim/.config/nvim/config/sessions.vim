" Shortcuts to execute session saves and restores
let g:session_dir = '~/.config/nvim/sessions'
exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
nnoremap <Leader>sp :Obsession<CR>
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

