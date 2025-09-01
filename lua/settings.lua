-- options.lua
--  vim: foldlevel=0 spell:

-- local global = vim.g
local cmd = vim.cmd
local o = vim.opt

-- General {{{

--    set nocompatible     "  explicitly get out of vi-compatible mode
--    set noexrc           "  don't use local version of .(g)vimrc, .exrc

o.cpoptions = 'aABceFsmq'
--             |||||||||
--             ||||||||+-- When joining lines, leave the cursor
--             ||||||||     between joined lines
--             |||||||+-- When a new match is created (showmatch) |||||||     pause for .5
--             ||||||+-- Set buffer options when entering the
--             ||||||     buffer
--             |||||+-- :write command updates current file name
--             ||||+-- Automatically add <CR> to the last line
--             ||||     when using :@r
--             |||+-- Searching continues at the end of the match
--             |||     at the cursor position
--             ||+-- A backslash has no special meaning in mappings
--             |+-- :write updates alternative file name
--             +-- :read updates alternative file name

--     filetype plugin indent on        " load filetype plugins/indent settings

--     "set autochdir                   " always switch to the current file directory
o.backspace = 'indent,eol,start' -- make backspace a more flexible
--     " set undofile                     " make persistent undo files throughout sessions
--     " set undodir=~/.vim/undodir       " where to put undo files
o.backup = true                                    -- make backup files
o.backupdir = vim.fn.stdpath('state') .. '/backup' -- where to put backup files
-- 'backupdir' 'bdir'	string	(default ".,$XDG_STATE_HOME/nvim/backup//")
--     "set clipboard+=unnamed          " share windows clipboard
--o.directory = vim.fn.expand('$HOME/.config/nvim/tmp')        -- directory to place swap files in
--     "set fileformats=unix,dos,mac    " support all three, in this order
o.hidden = true -- you can change buffers without saving
--     "(XXX: #VIM/tpope warns the line below could break things)
--     set iskeyword+=_,$,@,%,#         " none of these are word dividers
o.mouse = ''         -- disable mouse everywhere
o.errorbells = false -- don't make noise
--     "set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
--     "              | | | | | | | | |
--     "              | | | | | | | | +-- "]" Insert and Replace
--     "              | | | | | | | +-- "[" Insert and Replace
--     "              | | | | | | +-- "~" Normal
--     "              | | | | | +-- <Right> Normal and Visual
--     "              | | | | +-- <Left> Normal and Visual
--     "              | | | +-- "l" Normal and Visual (not recommended)
--     "              | | +-- "h" Normal and Visual (not recommended)
--     "              | +-- <Space> Normal and Visual
--     "              +-- <BS> Normal and Visual
o.wildmenu = true -- turn on command line completion wild style
-- ignore these list file extensions
o.wildignore = '*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png'
o.wildmode = 'list:longest:full' -- turn on wild mode huge list
-- " }}}}}}

-- UI Settings {{{
o.colorcolumn = '120' -- highligth column 120
--     "set cursorcolumn             " highlight the current column
-- o.cursorline = true            -- highlight current line
o.incsearch = true             -- BUT do highlight as you type you search phrase
o.laststatus = 2               -- always show the status line
o.lazyredraw = true            -- do not redraw while running macros
--     set linespace=0               " don't insert any extra pixel lines betweens rows
o.list = true                  -- we do what to show tabs, and trailing
o.listchars = 'tab:>-,trail:-' -- " show tabs and trailing
--     set matchtime=5               " how many tenths of a second to blink matching brackets for
o.hlsearch = true              -- highlight searched for phrases
o.startofline = false          -- leave my cursor where it was
o.visualbell = false           -- don't blink
o.number = true                -- turn on line numbers
o.relativenumber = true        -- turn on relative line numbers
o.numberwidth = 4              -- We are good up to 9999 lines
--     "set report=0                 " tell us when anything is changed via :...
o.ruler = true                 -- Always show current positions along the bottom
o.scrolloff = 10               -- Keep 10 lines (top/bottom) for scope
o.shortmess = 'aOstT'          -- shortens messages to avoid 'press a key' prompt
o.showcmd = true               -- show the command being typed
o.showmatch = true             -- show matching brackets
o.sidescrolloff = 10           -- Keep 5 lines at the size
--     "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]%=%{fugitive#statusline()}
-- o.statusline = '[%n]\ %t\ %F\ %m%r%h%w%{fugitive#statusline()}%=%y\ [%{&ff}]\ %l,%v\ %p%%'
---------------- XXXXXXXXXX o.statusline = '[%n] %t %F %m%r%h%w%{fugitive#statusline()}%=%y [%{&ff}] %l,%v %p%%'
--                               | | | | |  |   |      |  |     |    |
--                               | | | | |  |   |      |  |     |    + current
--                               | | | | |  |   |      |  |     |       column
--                               | | | | |  |   |      |  |     +-- current line
--                               | | | | |  |   |      |  +-- current % into file
--                               | | | | |  |   |      +-- current syntax in
--                               | | | | |  |   |          square brackets
--                               | | | | |  |   +-- current fileformat
--                               | | | | |  +-- number of lines
--                               | | | | +-- preview flag in square brackets
--                               | | | +-- help flag in square brackets
--                               | | +-- readonly flag in square brackets
--                               | +-- rodified flag in square brackets
--                               +-- full path to file in the buffer

o.winborder = 'rounded'
-- }}}

-- Text Formatting/Layout {{{
--     "set completeopt=menuone " show pop up menu for completions
--     "set completeopt=menu,menuone,longest " show pop up menu for completions
o.completeopt:remove('preview') -- show pop up menu for completions
--     " set diffopt+=algorithm:patience  " better diff
o.formatoptions = 'rq'          -- Automatically insert comment leader on return, and let gq format comments
o.ignorecase = true             -- case insensitive by default
o.infercase = true              -- case inferred by default
o.wrap = false                  -- do not wrap line
o.shiftround = true             -- when at 3 spaces, and I hit > ... go to 4, not 5
o.smartcase = true              -- if there are caps, go case-sensitive
o.shiftwidth = 4                -- auto-indent amount when using cindent, >>, << and stuff like that
o.softtabstop = 4               -- when hitting tab or backspace, how many spaces should a tab be (see expandtab)
o.tabstop = 4                   -- real tabs should be 8, and they will show with set list on
--    "set smarttab           " ????
o.expandtab = true              -- no real tabs please!
-- }}}

-- Folding {{{
o.foldenable = true -- Turn on folding
-- o.foldmarker = '{,}'                                -- Fold C style code (only use this as default
-- if you use a high foldlevel)
o.foldmethod = 'marker' -- Fold on the marker
o.foldlevel = 100       -- Don't autofold anything (but I can still fold manually)
-- }}}

--- Misc? {{{
-- o.completeopt = "menuone,noinsert,noselect" -- from cmp
o.completeopt = "noinsert,menuone,noselect"
-- set completeopt=noinsert,menuone
o.shortmess = o.shortmess + "c"
--- }}}

--- Text objects {{{

-- entire file text object
cmd [[ onoremap ae :<c-u>normal! mzggVG<cr>`z ]]

--- }}}

--- hitest {{{
-- " " adds to statusline
-- " set laststatus=2
-- " set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

--  " a little more informative version of the above
--  nmap <Leader>st :so $VIMRUNTIME/syntax/hitest.vim<CR>
--  nmap <Leader>sp :call <SID>SynStack()<CR>

--  function! <SID>SynStack()
--      if !exists("*synstack")
--          return
--      endif
--      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
--  endfunc

-- }}}
