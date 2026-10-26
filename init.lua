require('start-lazy')

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

require('settings')
require('keybindings')

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
        { import = "config/efm" },
        { import = "config/vim-commentary" },
        { import = "config/puppet" },
        { import = "config/codecompanion" },
    },
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

require('config.lsp')
require('autocmds')
