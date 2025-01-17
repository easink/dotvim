-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
-- /lazy

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

require('settings')
require('keybindings')

-- require("lazy").setup("plugins")
require("lazy").setup({
    spec = {
        { import = "plugins/git" },
        { import = "plugins/theme" },
        { import = "plugins/features" },
        { import = "plugins/treesitter" },
        { import = "plugins/cmp" },
        { import = "plugins/lspconfig" },
        { import = "plugins/telescope" },
        { import = "plugins/text-objects" },
        { import = "plugins/test" },
        { import = "plugins/ale" },
        { import = "plugins/markdown" },
        { import = "plugins/efm" },
        { import = "plugins/vim-commentary" },
        { import = "plugins/puppet" },
        { import = "plugins/elixir" },
        { import = "plugins/avante" },
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
require('autocommands')
