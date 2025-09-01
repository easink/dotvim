return {
    "ravitemer/mcphub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    build = "yarn global add mcp-hub@latest",
    config = function()
        require("mcphub").setup({})
    end
}
