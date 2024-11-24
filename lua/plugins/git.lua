return {
   -- git
   {
       'tpope/vim-fugitive',
       init = function()
         vim.opt.statusline = '[%n] %t %F %m%r%h%w%{fugitive#statusline()}%=%y [%{&ff}] %l,%v %p%%'

       end,
    }
   -- 'gregsexton/gitv',
   -- 'tpope/vim-git',
   -- 'http://www.tidraso.co.uk/repository/vim-plugin/',

}
