require('start-lazy')

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"


require('settings')
require('keybindings')

-- require("lazy").setup("plugins")
require("lazy").setup({
    spec = {
        { import = "config/git" },
        { import = "config/theme" },
        { import = "config/features" },
        { import = "config/treesitter" },
        { import = "config/cmp" },
        { import = "config/lsp-signature" },
        { import = "config/lspconfig" },
        { import = "config/telescope" },
        { import = "config/tiny" },
        { import = "config/text-objects" },
        { import = "config/test" },
        -- { import = "config/ale" },
        { import = "config/markdown" },
        { import = "config/efm" },
        { import = "config/vim-commentary" },
        { import = "config/puppet" },
        { import = "config/elixir" },
        -- { import = "config/avante" },
        { import = "config/codecompanion" },
        { import = "config/mcphub" },
    },
    -- install = { colorscheme = { "habamax" } },
    -- install = { colorscheme = { "mustang" } },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
        -- notify = false
    },
    profiling = {
        loader = false,
        require = false,
    },
})

-- require('must')
-- require('lsp')
require('config.lsp')
require('autocmds')
