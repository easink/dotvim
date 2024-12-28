return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        --
        "jfpedroza/neotest-elixir",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-elixir")({
                    extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
                    args = { "--trace" },
                })
            },
        })
    end,
    keys = {
        -- Run tests in file
        { "<leader>te", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run tests in file" },
        -- Run nearest tests
        { "<leader>tn", function() require("neotest").run.run() end,                   desc = "Run nearest tests" },
        { "<leader>tm", function() require("neotest").summary.marked() end },
        { "<leader>ts", function() require("neotest").summary.toggle() end },

    }

}
