return {
    -- coding - elixir
    -- {
    --     'elixir-editors/vim-elixir',
    --     fs = "elixir",
    -- }
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")

            elixir.setup {
                nextls = { enable = false },
                elixirls = {
                    enable = true,
                    tag = "v0.26.2",
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = true,
                        fetchDeps = false,
                        suggestSpecs = false,

                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                    end,
                },
                projectionist = {
                    enable = true
                }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    }
    -- 'florinpatrascu/vscode-elixir-snippets',

}
