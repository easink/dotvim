-- keybindings.lua
--  vim: foldlevel=0 spell:

vim.g.mapleader = ','
-- vim.g.maplocalleader = ','

--     " dont invalid vim function
--     nnoremap \ ,

-- Force me to ignore arrow keys
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')

--     " Buftabline toggle
--     nnoremap <silent> <leader>b :call BuftablineToggle()<cr>

--     function! BuftablineToggle()
--         if g:buftabline_show == 0
--             let g:buftabline_show = 1
--             call buftabline#update(0)
--         else
--             let g:buftabline_show = 0
--             call buftabline#update(0)
--         endif
--     endfunction


-- Remove trailing spaces
--   nnoremap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR><C-o>
vim.keymap.set('n', '<leader>W', [[:%s/\s\+$//e<cr>]], { silent = true })
-- vim.keymap.set('n', '<leader>W', [[:lua vim.lsp.buf.format()<cr> <bar> :%s/\s\+$//e<cr>]])


--     " Yank and paste X11 clipboard
--     nnoremap gp "+p
--     nnoremap gP "+P
--     "nnoremap gP "*p
--     vnoremap gy "+y
--     "vnoremap gY "*y

--     " Reselect pasted text
--     nnoremap <leader>v V`]


-- Telecope
--     nnoremap <leader>ff <cmd>Telescope find_files<cr>
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
--     nnoremap <leader>. <cmd>Telescope find_files<cr>
vim.keymap.set('n', '<leader>.', '<cmd>Telescope find_files<cr>')
--     " nnoremap <leader>fg <cmd>Telescope git_files<cr>
--     nnoremap <leader>fg <cmd>Telescope live_grep<cr>
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
--     nnoremap <leader>fb <cmd>Telescope buffers<cr>
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
--     nnoremap <leader>fh <cmd>Telescope help_tags<cr>
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

--     " Reindent / Format / Prettify
--     nnoremap <silent> <leader>p ggVGgq2<C-o>
--     nnoremap <silent> <leader>pp ggVGgq2<C-o>
--     " csv - quick and dirty
--     nnoremap <silent> <leader>pc :Tabularize /,\zs<cr>
--     vnoremap <silent> <leader>pc :Tabularize /,\zs<cr>
--     "nnoremap <silent> <leader>pc :!csvtool readable -<cr>
--     " xml
--     nnoremap <silent> <leader>px :%!xmllint --recover --format -<cr>
--     vnoremap <silent> <leader>px :!xmllint --recover --format -<cr>
--     "nnoremap <silent> <leader>px :!xmllint --format --html --xmlout<cr>
--     " html
--     nnoremap <silent> <leader>ph :%!pandoc -f html -t html<cr>
--     vnoremap <silent> <leader>ph :!pandoc -f html -t html<cr>

--     " abbreviations
--     iabbrev ymd <C-R>=strftime("%F")<CR>

-- Toggle line numbers on fold column for easy copying
--     "nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
--     nnoremap <silent> <F2> :set nonumber!<CR>:set norelativenumber!<cr>
vim.keymap.set('n', '<F2>', ':set nonumber!<CR>:set norelativenumber!<cr>', { silent = true })

--     " Toggle Indent guides
--     nnoremap <silent> <F3> :IndentGuidesToggle<cr>
--     " Toggle Tagbar
--     nnoremap <silent> <F4> :TagbarToggle<CR>

--     " High light search - in neovim default?
--     " map /  <Plug>(incsearch-forward)
--     " map ?  <Plug>(incsearch-backward)
--     " map g/ <Plug>(incsearch-stay)

--     " Clear highlighted search, need to test to know what version I want!
vim.keymap.set('n', '<CR>', '<cmd>nohlsearch<cr><cr>', { silent = true })
--     nnoremap <silent> <CR> :nohlsearch<CR><CR>
--     nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

--     " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
--     nmap <silent> <leader>tn :TestNearest<CR>
--     nmap <silent> <leader>tf :TestFile<CR>
--     nmap <silent> <leader>ts :TestSuite<CR>
--     nmap <silent> <leader>tl :TestLast<CR>
--     nmap <silent> <leader>tv :TestVisit<CR>

--     " ROT13 - fun
--     "map <F12> ggVGg?

--     " Use shorter for n. pattern
--     nnoremap <C-å> n.

-- Window movements
vim.keymap.set('n', '<C-j>', '<C-W>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { silent = true })

--     " FSwitch
--     nnoremap <leader>o :FSSplitAbove<CR>

--     " Spell
--     "map <leader>ss :setlocal spell!
--     "map <leader>sn ]s
--     "map <leader>np [s
--     "map <leader>sa zg
--     "map <leader>s? z=

--     " I always let go of shift too slow...
--     cab Q q
--     cab W w
--     cab X x
