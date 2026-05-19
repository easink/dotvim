--  vim: set foldlevel=0 spell:

return {
    -- tree-sitter-manager (replaces archived nvim-treesitter) {{{
    {
        "romus204/tree-sitter-manager.nvim",
        lazy = false,
        config = function()
            require("tree-sitter-manager").setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query", "bash",
                    "python", "markdown", "markdown_inline",
                    "json", "yaml", "toml", "elixir", "heex",
                    "css", "javascript", "gitcommit",
                },
                auto_install = false,
                highlight = true, -- enables vim.treesitter.start automatically
            })
        end,
    },
    -- }}}

    -- nvim-treesitter-textobjects (standalone, main branch) {{{
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = false,
                },
                move = {
                    set_jumps = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local move = require("nvim-treesitter-textobjects.move")

            -- Select text objects
            vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)

            -- Move between text objects
            vim.keymap.set({ "n", "x", "o" }, "]m",
                function() move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]c",
                function() move.goto_next_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]M",
                function() move.goto_next_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]C",
                function() move.goto_next_end("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[m",
                function() move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[c",
                function() move.goto_previous_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[M",
                function() move.goto_previous_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[C",
                function() move.goto_previous_end("@class.outer", "textobjects") end)
        end,
    },
    -- }}}

    -- nvim-treesitter-endwise (no config; uses vim.treesitter queries) {{{
    {
        "RRethy/nvim-treesitter-endwise",
        event = "InsertEnter",
    },
    -- }}}

    -- nvim-ts-autotag (self-configures) {{{
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- }}}
}
