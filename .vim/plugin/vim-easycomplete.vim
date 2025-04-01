let g:easycomplete_enable = 1
let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_lsp_checking = 0
let g:easycomplete_signature_enable = 1
let g:easycomplete_nerd_font = 1
let g:easycomplete_pum_format = ['kind', 'abbr', 'menu']

" Keymap
nnoremap <leader>gr :EasyCompleteReference<CR>
nnoremap <leader>gd :EasyCompleteGotoDefinition<CR>
nnoremap <leader>gb :BackToOriginalBuffer<CR>
nnoremap <leader>rn :EasyCompleteRename<CR>

