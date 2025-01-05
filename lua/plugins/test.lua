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
        -- Run test suite
        { "<leader>tt", function() require("neotest").run.run(vim.uv.cwd()) end,            desc = "Run all tests in suite" },
        -- Run tests in file
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,      desc = "Run tests in file" },
        -- Run nearest tests
        { "<leader>tn", function() require("neotest").run.run() end,                        desc = "Run nearest tests" },
        -- Run nearest tests
        { "<leader>tl", function() require("neotest").run.run_last() end,                   desc = "Run Last tests" },
        -- { "<leader>tm", function() require("neotest").summary.marked() end },
        -- toggle test summary
        { "<leader>ts", function() require("neotest").summary.toggle() end },
        -- show test output
        { "<leader>to", function() require("neotest").output.open() end },
        -- toggle test panel output
        { "<leader>tp", function() require("neotest").output_panel.toggle() end },
        -- toggle file test watch
        { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle watch file test" },
        -- jump to previous failed test
        { "[r",         function() require("neotest").jump.prev({ status = "failed" }) end },
        -- jump to next failed test
        { "]r",         function() require("neotest").jump.next({ status = "failed" }) end },
    }

}
