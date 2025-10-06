return {
    -- features
    -- 'haya14busa/is.vim',
    'tpope/vim-unimpaired',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    {
        'tpope/vim-projectionist',
        config = function()
            vim.keymap.set('n', '<leader>,', '<cmd>A<cr>', { desc = "Alternate file" })
        end,
    },
    -- 'chrisbra/Recover.vim',
    -- 'kabbamine/zeavim.vim',
    -- 'sheerun/vim-polyglot',
    {
        'andymass/vim-matchup',
        opts = {
            treesitter = {
                stopline = 500,
            }
        }
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
