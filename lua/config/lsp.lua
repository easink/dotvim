---- lsp.lua
----  vim: foldlevel=0 spell:

---- vim.lsp.set_log_level("debug")

---- vim.keymap.set('v', '<leader>f', vim.lsp.buf.format, { buffer = true })
---- vim.keymap.set('v', '<leader>1f', vim.lsp.buf.format, bufopts)

--function MyFormat()
--    vim.lsp.buf.format({
--        async = true,
--        range = {
--            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
--            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
--        }
--    })
--end

---- handlers {{{

---- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
----     vim.lsp.diagnostic.on_publish_diagnostics, {
----         -- Enable underline, use default values
----         -- underline = true,
----         -- Enable virtual text, override spacing to 4
----         virtual_text = true,
----         -- Disable a feature
----         -- update_in_insert = false,
----     })

---- }}}

---- Keybindings {{{

------------------- local range_formatting = function()
-------------------     local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
-------------------     local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
-------------------     vim.lsp.buf.format({
-------------------         range = {
-------------------             ["start"] = { start_row, 0 },
-------------------             ["end"] = { end_row, 0 },
-------------------         },
-------------------         async = true,
-------------------     })
------------------- end
-------------------
------------------- vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.api.nvim_create_autocmd('LspAttach', {
    -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- print("LspAttach")
        -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
        -- if client.server_capabilities.document_range_formatting then
        -- print(vim.inspect(client.server_capabilities))
        -- end

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
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', require("tiny-code-action").code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
        --     vim.lsp.buf.format({ async = true })
        -- end, opts)
    end,
})

---- }}}
