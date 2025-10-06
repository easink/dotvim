return {
    -- git
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            -- "echasnovski/mini.pick",
            -- "folke/snacks.nvim",
        },
    }
    -- {
    --     'tpope/vim-fugitive',
    --     init = function()
    --       vim.opt.statusline = '[%n] %t %F %m%r%h%w%{fugitive#statusline()}%=%y [%{&ff}] %l,%v %p%%'

    --     end,
    --  }
    -- 'gregsexton/gitv',
    -- 'tpope/vim-git',
    -- 'http://www.tidraso.co.uk/repository/vim-plugin/',

}
