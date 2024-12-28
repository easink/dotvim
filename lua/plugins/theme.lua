--  vim: set foldmarker={,} foldlevel=0 spell:

return {
    -- 'nathanaelkane/vim-indent-guides',
    -- mustang {{{
    {
        "easink/mustang",
        init = function()
            -- set background=light
            vim.cmd('colorscheme mustang')
            --  colorscheme solarized
            --  colorscheme gruvbox
            --  colorscheme birds_of_paradise

            -- complement to mustang...
            vim.cmd('hi ColorColumn guibg=#2d2d2d ctermbg=236')
            vim.cmd('hi link ALEWarningSign Error')
            vim.cmd('hi link LspWarningText WarningMsg')
            vim.cmd('hi link LspWarningHighlight Underlined')
            vim.cmd('hi LspWarningVirtualText ctermfg=9 ctermbg=237')
            vim.cmd('hi link LspDiagnosticsVirtualTextWarning NonText')

            -- cmp
            -- vim.cmd('hi default link CmpItemKind CmpItemMenuDefault')

            vim.opt.termguicolors = true
            vim.cmd('syntax enable') -- syntax highlighting on
        end,
    },
    -- }}}
    -- 'godlygeek/csapprox',
    -- 'bmcilw1/mustang-vim',
    -- 'TheMrNomis/mustang-vim',
    -- 'gruvbox-community/gruvbox',
    -- 'altercation/vim-colors-solarized',
    -- 'amacdougall/Birds-of-Paradise-VIM-Theme',
    -- buftabline {{{
    {
        'ap/vim-buftabline',
        init = function()
            vim.g.buftabline_show = 1 -- show when at least two buffers exists
            vim.g.buftabline_numbers = 1
        end,
    },
    -- 'lifepillar/vim-colortemplate',
    -- }}}


    -- border {{{
    -- local _border = 'single'

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --   vim.lsp.handlers.hover, {
    --     border = _border
    --   }
    -- )

    -- -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    -- --   vim.lsp.handlers.signature_help, {
    -- --     border = _border
    -- --   }
    -- -- )

    -- -- vim.diagnostic.config{
    -- --   float={border=_border}
    -- -- }

    -- require('lspconfig.ui.windows').default_options.border = _border

    -- }}}


}

-- " Vim UI {
--     set colorcolumn=120          " highligth column 120
--     "set cursorcolumn            " highlight the current column
--     "set cursorline              " highlight current line
--     set incsearch                " BUT do highlight as you type you search phrase
--     set laststatus=2             " always show the status line
--     set lazyredraw               " do not redraw while running macros
--     set linespace=0              " don't insert any extra pixel lines betweens rows
--     set list                     " we do what to show tabs, to ensure we get them out of my files
--     set listchars=tab:>-,trail:- " show tabs and trailing
--     set matchtime=5              " how many tenths of a second to blink matching brackets for
--     set hlsearch                 " highlight searched for phrases
--     set nostartofline            " leave my cursor where it was
--     set novisualbell             " don't blink
--     set number                   " turn on line numbers
--     set relativenumber           " turn on relative line numbers
--     set numberwidth=4            " We are good up to 9999 lines
--     "set report=0                " tell us when anything is changed via :...
--     set ruler                    " Always show current positions along the bottom
--     set scrolloff=10             " Keep 10 lines (top/bottom) for scope
--     set shortmess=aOstT          " shortens messages to avoid 'press a key' prompt
--     set showcmd                  " show the command being typed
--     set showmatch                " show matching brackets
--     set sidescrolloff=10         " Keep 5 lines at the size
--     "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]%=%{fugitive#statusline()}
--     set statusline=[%n]\ %t\ %F\ %m%r%h%w%{fugitive#statusline()}%=%y\ [%{&ff}]\ %l,%v\ %p%%
--     "                         | | | | |  |   |      |  |     |    |
--     "                         | | | | |  |   |      |  |     |    + current
--     "                         | | | | |  |   |      |  |     |       column
--     "                         | | | | |  |   |      |  |     +-- current line
--     "                         | | | | |  |   |      |  +-- current % into file
--     "                         | | | | |  |   |      +-- current syntax in
--     "                         | | | | |  |   |          square brackets
--     "                         | | | | |  |   +-- current fileformat
--     "                         | | | | |  +-- number of lines
--     "                         | | | | +-- preview flag in square brackets
--     "                         | | | +-- help flag in square brackets
--     "                         | | +-- readonly flag in square brackets
--     "                         | +-- rodified flag in square brackets
--     "                         +-- full path to file in the buffer

-- }
