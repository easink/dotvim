--  vim: set foldlevel=0 spell:

return {
    -- nvim-tree-sitter {{{
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                branch = "main",
            },
            'RRethy/nvim-treesitter-endwise',
            'windwp/nvim-ts-autotag',
        },
        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "lua", "vim", "vimdoc", "query", "bash",
                "python", "markdown", "markdown_inline",
                "json", "yaml", "toml", "elixir",
            })

            -- Enable treesitter highlighting + indent for every filetype
            -- that has a parser available. On the `main` branch, highlighting
            -- is NOT enabled automatically and must be started per buffer.
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('TreesitterStart', { clear = true }),
                callback = function(args)
                    local bufnr = args.buf
                    local ft = vim.bo[bufnr].filetype
                    local lang = vim.treesitter.language.get_lang(ft)
                    if lang and pcall(vim.treesitter.start, bufnr, lang) then
                        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })

            -- nvim-treesitter-textobjects (main branch)
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
            vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer",    "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner",    "textobjects") end)

            -- Move between text objects
            vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer",   "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer",      "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer",     "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer",        "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer",    "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer",   "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer",      "textobjects") end)

            -- nvim-ts-autotag (self-configures; opts go into setup)
            require("nvim-ts-autotag").setup()

            -- nvim-treesitter-endwise requires no configuration.
        end,
    },
    -- }}}
}
