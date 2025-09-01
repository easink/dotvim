-- lsp.lua
--  vim: foldlevel=0 spell:

return {
    'hrsh7th/nvim-cmp',
    -- event = { "InsertEnter", "CmdlineEnter", "BufEnter" },
    event = "InsertEnter",
    dependencies = {
        -- snippets
        -- "SirVer/ultisnips",
        -- "quangnguyen30192/cmp-nvim-ultisnips",
        -- sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",

        -- {
        --     "L3MON4D3/LuaSnip",
        --     version = "v2.*",
        --     -- install jsregexp (optional!).
        --     build = "make install_jsregexp",
        -- },
        -- "rafamadriz/friendly-snippets",
        -- "onsails/lspkind.nvim", -- vs-code like pictograms
        -- "petertriho/cmp-git"
    },
    config = function()
        local cmp = require("cmp")
        -- local lspkind = require("lspkind")
        -- local luasnip = require("luasnip")

        -- require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    -- luasnip.lsp_expand(args.body)
                    -- vim.fn["UltiSnips#Anon"](args.body)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                -- Add borders around the popup window
                -- completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- ['<C-n>'] = cmp.mapping.goto_next(),
                -- ['<C-p>'] = cmp.mapping.goto_prev(),
                -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                -- ["<CR>"] = cmp.mapping.confirm({
                --     behavior = cmp.ConfirmBehavior.Replace,
                --     select = true,
                -- }),
                ['<C-j>'] = cmp.mapping.confirm({
                    -- behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
            }),
            sources = cmp.config.sources({
                -- { name = 'ultisnips' },
                -- { name = "luasnip" },
                { name = "nvim_lsp" },
                -- { name = "nvim_lsp_signature_help" },
                -- { name = "buffer",                 max_item_count = 4 },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.cmd([[
            set completeopt=menuone,noinsert,noselect
            highlight! default link CmpItemKind CmpItemMenuDefault
        ]])
    end,
}

-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
