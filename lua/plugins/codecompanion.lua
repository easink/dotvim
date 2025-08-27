return {
    {
        "olimorris/codecompanion.nvim",
        opts = {
            adapters = {
                http = {
                    copilot = function()
                        return require("codecompanion.adapters").extend("copilot", {
                            model = "claude-3.5-sonnet",
                            -- model = "claude-sonnet-4-20250514"
                        })
                    end,
                },
            },
            strategies = {
                chat = {
                    adapter = {
                        name = "copilot",
                    }
                },
                inline = {
                    adapter = {
                        name = "copilot",
                    }
                },
                cmd = {
                    adapter = {
                        name = "copilot",
                    }
                }
            },
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        make_vars = true,
                        make_slash_commands = true,
                        show_result_in_chat = true
                    }
                }
            },
            sources = {
                per_filetype = {
                    codecompanion = { "codecompanion" },
                }
            },
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
            "ravitemer/mcphub.nvim",
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                ft = { "markdown", "codecompanion" },
            },
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
