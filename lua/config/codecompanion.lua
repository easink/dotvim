return {
    {
        "olimorris/codecompanion.nvim",
        opts = {
            -- Use the OpenCode ACP adapter. OpenCode handles its own auth
            -- and model selection via ~/.config/opencode/opencode.json.
            interactions = {
                chat   = { adapter = "opencode" },
                inline = { adapter = "opencode" },
                cmd    = { adapter = "opencode" },
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
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
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
