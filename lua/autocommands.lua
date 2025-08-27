-- autocommands.lua
--  vim: foldlevel=0 spell:

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { '*' },
    command = [[
        if line("'\"") > 0 && line("'\"") <= line("$") |
          exe "normal g'\"" |
        endif
    ]]
})

-- local my_formatexpr_wrapper = function(filter)
--   -- only reformat on explicit gq command
--   if not vim.fn.mode() == 'n' then
--      -- fall back to Vims internal reformatting
--      return 1
--   end

--   -- local opts = {}
--   local lstart = vim.v.lnum
--   local lend = lstart + vim.v.count - 1
--   if lstart >= 0 and lend >= 0 then
--     -- lsp.buf.range_formatting(opts, {start_line, 0}, {end_line, 0})
--     local command = lstart .. ',' .. lend .. '!' .. filter
--     vim.cmd({ cmd = 'echo', args = { command } })
--     vim.cmd(command)
--   end

--   return 0
-- end

-- Remember info about open buffers on close
--     " set viminfo^=%

-- -- Use local formatexpr instead of gloabl formatprg, stolen from Drew Neil
-- vim.cmd [[
-- function! FormatprgLocal(filter)
--     if !empty(v:char)
--         return 1
--     else
--         let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
--         echo l:command
--         execute l:command
--     endif
-- endfunction
-- ]]

-- local format_prg_local = function(filter)
--     -- buffer ( 0 = current )
--     -- local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     -- local command = row .. ',.' .. (row + v:count - 1) .. '!' .. filter

--     local command = '!' .. filter
--     vim.cmd('echo xxx ' .. command)
--     -- vim.command(command)
-- end

--     " C {
--         function FT_C()
--             set autowrite
--             "set noexpandtab
--             set tabstop=4
--             set shiftwidth=4

--             set cindent
--             set cino=(0,:0
--             "         |  +--------- case placement
--             "         +------------ second line parameter placement
--             set autoindent
--             set smartindent
--             set sm smd
--             " set nomesg sm smd
--             set fo=croq

--             " Complete options (disable preview scratch window)
--             " set completeopt=menuone,preview
--             " set completeopt-=preview
--             " Limit popup menu height
--             set pumheight=15

--             if has("insert_expand")
--                     set showfulltag
--             endif

--             " Makes ctrl-g show the buffer # as well.
--             noremap <C-G> 2<C-G>
--         endfunction
--         au BufRead,BufNewFile *.c,*.h call FT_C()
--         " linux kernel at $HOME/source/linux.git/*
--         autocmd BufNewFile,BufRead $HOME/source/linux.git/* set tabstop=8 shiftwidth=8 columns=80 colorcolumn=81 nolist

--     " }

-- Markdown {{{
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function(_)
        -- print('event fired: ' .. vim.inspect(ev))
        vim.opt_local.formatprg = 'pandoc -s -f markdown -t gfm -sp --tab-stop=2'
    end
})
-- }}}

--     " HTML {
--         au FileType html setlocal formatexpr=FormatprgLocal('pandoc\ -f\ html\ -t\ html')
--         " au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format\ --html\ --xmlout')
--     " }
--     " XML {
--         au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format')
--     " }

-- Elixir {{{
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'elixir', 'eelixir', 'heex' },
    callback = function(_)
        -- print('event fired: ' .. vim.inspect(ev))
        -- vim.opt_local.makeprg = 'mix compile'
        -- vim.opt_local.errorformat = {
        --     '%Wwarning: %m',
        --     '%C%f:%l,%Z',
        --     '%E== Compilation error in file %f ==',
        --     '%C** (%\\w%\\+) %f:%l: %m,%Z'
        -- }
        -- ExUnit
        -- let s:cpo_save = &cpo
        -- set cpo-=C

        -- Compiling 1 file (.ex)
        --   error: undefined function ddef/2 (there is no such import)
        --   │
        -- 15 │   ddef hello do
        --   │   ^
        --   │
        --   └─ lib/vimtest.ex:15:3: Vimtest (module)

        -- == Compilation error in file lib/vimtest.ex ==
        -- ** (CompileError) lib/vimtest.ex: cannot compile module Vimtest (errors have been logged)
        vim.opt_local.makeprg = 'mix'
        -- vim.opt_local.errorformat = {
        --     '%E  %n) %m',
        --     '%+G     ** %m',
        --     '%+G     stacktrace:',
        --     '%C     f:%l',
        --     '%+G       (%\\w%\\+) %f:%l: %m',
        --     '%+G       %f:%l: %.%#',
        --     '** (%\\w%\\+) %f:%l: %m'
        -- }
        vim.opt_local.errorformat = {
            -- '%E%.%#error: %m',
            -- '%C%.%#│',
            -- '%C%.%#│%.%#',
            -- '%C%.%#│%.%#',
            -- '%C%.%#│',
            -- '%Z%.%#└─ %f:%l:%c: %m',
            -- '%-G',
            -- '%-GCompiling %.%#',
            -- '%-G== Compilation %.%#',
            -- '%-G** %.%#',
        }
        --
        -- let &cpo = s:cpo_save
        -- unlet s:cpo_save

        -- Credo
        -- errorformat=%f:%l:%c:\ %t:\ %m,%f:%l:\ %t:\ %m
        -- makeprg=mix\ credo\ suggest\ --format=flycheck
    end
})
-- BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     -- pattern = { 'elixir', 'eelixir', 'heex' },
--     pattern = { '*.ex', '*.exs', '*.eex', '*.heex' },
--     callback = function(_)
--         vim.lsp.buf.format()
--     end
-- })
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'elixir', 'eelixir', 'heex' },
--     callback = function(_)
--     end
-- })
-- au FileType elixir setlocal formatexpr=FormatprgLocal('mix\ --format\ -')
-- }}}

-- Rust {{{
-- BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.rs' },
    callback = function(_)
        vim.lsp.buf.format()
    end
})
-- }}}

--     " Python {
--         " Tests
--         au FileType python nnoremap <localleader>t :!nose2<cr>
--     " }
--     " Ruby {
--         " ruby standard 2 spaces, always
--         au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
--         au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
--     " }
--     " Mail {
--         au BufRead,BufNewFile *mutt-* set filetype=mail
--     " }
--     " Notes {
--         " I consider .notes files special, and handle them differently, I
--         " should probably put this in another file
--         au BufRead,BufNewFile *.notes set foldlevel=2
--         au BufRead,BufNewFile *.notes set foldmethod=indent
--         au BufRead,BufNewFile *.notes set tabstop=8
--         au BufRead,BufNewFile *.notes set syntax=notes
--         au BufRead,BufNewFile *.notes set nocursorcolumn
--         au BufRead,BufNewFile *.notes set nocursorline
--         au BufRead,BufNewFile *.notes set guifont=Consolas:h12
--         au BufRead,BufNewFile *.notes set spell
--     " }
--     au BufNewFile,BufRead *.ahk setf ahk
-- }}}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- print("LspAttach")
        -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
        -- if client.server_capabilities.document_range_formatting then
        -- print(vim.inspect(client.server_capabilities))
        -- end

        -- print(vim.inspect(ev))
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- vim.bo[ev.buf].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
        -- vim.bo[ev.buf].formatexpr = nil

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)
        -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>f', function()
        vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
