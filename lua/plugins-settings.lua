-- plugins-settings.lua
--  vim: foldlevel=0 spell:

-- nvim-treesitter {{{
require('nvim-treesitter.configs').setup({
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = false},
})
-- }}}

-- ALE {{{
vim.g.ale_disable_lsp = 1

vim.g.ale_use_neovim_diagnostics_api = 1

-- Ale
-- vim.g.ale_sign_error = '⤫'
-- vim.g.ale_sign_warning = '⚠'

vim.g.ale_echo_msg_format = '[%severity%] %s [%linter%][%code%]'

-- vim.g:ale_linters = {'go': ['gometalinter']}
--     " \ 'elixir': ['credo', 'dialyxir', 'elixir-ls', 'mix'],

-- vim.g.ale_linters = {
--   elixir = { 'credo', 'dialyxir', 'mix' },
--   rust = { 'cargo', 'rls', 'rustc' },
--   go = { 'gometalinter' }
-- }

vim.g.ale_fix_on_save = 1

vim.g.ale_fixers = {
  -- elixir = { 'mix_format' },
  -- rust = { 'rustfmt' },
  -- python = { 'yapf' },
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' }
}
-- }}}

-- Ultisnips {{{
-- vim.g.UltiSnipsSnippetDirectories = { }
-- }}}

-- Buftabline {{{
vim.g.buftabline_show = 1   -- show when at least two buffers exists
vim.g.buftabline_numbers = 1
-- }}}

--     let b:match_ignorecase = 1 " case is stupid
--     let perl_extended_vars=1   " highlight advanced perl vars inside strings

--     " Pandoc
--     let g:pandoc#spell#enabled = 0  " bad highlighting

--     set completeopt=noinsert,menuone,noselect
--     " noselect -> crash when vim-snippet/ultisnips/languageclient " (snippet-lsp)
--     " set completeopt=noinsert,menuone
--     set shortmess+=c

--     " Code navigation shortcuts
--     nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
--     nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
--     nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
--     nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
--     nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
--     nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
--     nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
--     nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
--     nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

--     " Set updatetime for CursorHold
--     " 300ms of no cursor movement to trigger CursorHold
--     set updatetime=300
--     " Show diagnostic popup on cursor hold
--     " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
--     " autocmd CursorHold * lua vim.lsp.diagnostic.show()
--     autocmd CursorHold * lua vim.diagnostic.open_float()

--     " Goto previous/next diagnostic warning/error
--     nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
--     nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

--     " have a fixed column for the diagnostics to appear in
--     " this removes the jitter when warnings/errors flow in
--     " set signcolumnCR=yes
--     "

--     " elm {
--     " disable polyglot
--     " let g:polyglot_disabled = ['elm']
--     " }
