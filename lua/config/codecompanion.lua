return {
    {
        "olimorris/codecompanion.nvim",
        opts = {
            -- The `interactions` key was renamed from `strategies` in
            -- codecompanion v18.0.0. Setting `adapter = { name, model }`
            -- directly is simpler than extending the adapter via
            -- `adapters.http.<name>`.
            --
            -- To discover valid Copilot model ids, run `:CodeCompanionActions`
            -- and pick "Change Adapter Model" in a chat buffer.
            interactions = {
                chat = {
                    adapter = {
                        name = "copilot",
                        model = "claude-haiku-4.5",
                        -- Other Copilot options worth trying:
                        --   "claude-3.5-sonnet"
                        --   "claude-sonnet-4"
                        --   "gpt-4.1"
                    },
                },
                inline = {
                    adapter = { name = "copilot", model = "claude-haiku-4.5" },
                },
                cmd = {
                    adapter = { name = "copilot", model = "claude-haiku-4.5" },
                },
            },
            extensions = {
                -- mcphub = {
                --     callback = "mcphub.extensions.codecompanion",
                --     opts = {
                --         make_vars = true,
                --         make_slash_commands = true,
                --         show_result_in_chat = true
                --     }
                -- }
            },
            -- sources = {
            --     per_filetype = {
            --         codecompanion = { "codecompanion" },
            --     }
            -- },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                -- for providers='copilot'
                "zbirenbaum/copilot.lua",
                -- cmd = "Copilot",
                -- event = "InsertEnter",
                config = function()
                    require("copilot").setup({})
                end,
            },
            -- "ravitemer/mcphub.nvim",
            -- {
            --     -- Make sure to set this up properly if you have lazy=true
            --     'MeanderingProgrammer/render-markdown.nvim',
            --     ft = { "markdown", "codecompanion" },
            -- },
            {
                "echasnovski/mini.diff",
                config = function()
                    local diff = require("mini.diff")
                    diff.setup({
                        -- Disabled by default
                        source = diff.gen_source.none(),
                    })
                end,
            },
        },
    },
}
