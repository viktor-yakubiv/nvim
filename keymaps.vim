nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gI <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>
nnoremap <leader>lf <cmd>lua vim.lsp.buf.format{ async = true }<cr>
nnoremap <leader>la <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>lj <cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>
nnoremap <leader>lk <cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>
nnoremap <leader>lr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ls <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>lq <cmd>lua vim.diagnostic.setloclist()<cr>
nnoremap <leader>\re <cmd>Rexplore<cr>
nnoremap <leader>\e <cmd>Exprolore<cr>

" Navigayion by pages with screen centered
" Thanks to @ThePrimagen for sharing this nice hack
nnoremap <C-f> <C-f>z.
nnoremap <C-d> <C-d>z.
nnoremap <C-b> <C-b>z.
nnoremap <C-u> <C-u>z.
