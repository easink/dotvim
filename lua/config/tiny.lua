return {
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        event = "LspAttach",
        keys = {
            {
                "<leader>ca",
                function() require("tiny-code-action").code_action() end,
                mode = { "n", "x" },
                noremap = true,
                silent = true,
            }
        },
        opts = {
            backend = "vim",
            picker = "telescope",
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
        end
    }
}
