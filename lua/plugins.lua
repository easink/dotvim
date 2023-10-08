-- plugins.lua
--  vim: set foldlevel=0 spell:

require("lazy").setup({

  -- for the looks
  -- 'nathanaelkane/vim-indent-guides',
  -- 'godlygeek/csapprox',
  'easink/mustang',
  -- 'bmcilw1/mustang-vim',
  -- 'TheMrNomis/mustang-vim',
  -- 'gruvbox-community/gruvbox',
  -- 'altercation/vim-colors-solarized',
  -- 'amacdougall/Birds-of-Paradise-VIM-Theme',
  'ap/vim-buftabline',

  -- features
  -- 'haya14busa/is.vim',
  'tpope/vim-unimpaired',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-projectionist',
  -- 'chrisbra/Recover.vim',
  -- 'kabbamine/zeavim.vim',
  -- 'sheerun/vim-polyglot',
  'tpope/vim-endwise',

  -- git
  'tpope/vim-fugitive',
  -- 'gregsexton/gitv',
  -- 'tpope/vim-git',
  -- 'http://www.tidraso.co.uk/repository/vim-plugin/',

  -- telescope
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- tree sitter
  { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-context',
  'RRethy/nvim-treesitter-endwise',

  -- text objects
  -- 'wellle/targets.vim',
  -- 'tpope/vim-jdaddy',
  -- 'sukima/xmledit',
  'godlygeek/tabular',
  -- 'kana/vim-textobj-user',
  -- 'kana/vim-textobj-indent',
  -- 'kana/vim-textobj-function',
  -- 'bps/vim-textobj-python', { 'for': 'python' },
  -- 'idbrii/textobj-word-column.vim',
  -- 'Lokaltog/vim-easymotion',
  -- 'jeetsukumaran/vim-indentwise',
  -- 'libclang-vim/libclang-vim'
  -- 'libclang-vim/vim-textobj-clang',
  -- 'aoswalt/vim-textobj-elixir',

  -- markdown
  -- 'vim-pandoc/vim-pandoc'
  -- 'vim-pandoc/vim-pandoc-syntax'
  -- 'plasticboy/vim-markdown'

  -- coding
  -- 'majutsushi/tagbar'
  --     "Plug 'msanders/snipmate.vim'
  -- 'SirVer/ultisnips'
  -- 'honza/vim-snippets'
  -- 'tandrewnichols/vim-contemplate'
  'dense-analysis/ale',
  --     " Plug 'scrooloose/nerdcommenter'
  'tpope/vim-commentary',
  -- 'janko-m/vim-test'
  --     "

  -- Standalone UI for nvim-lsp progress
  -- 'j-hui/fidget.nvim', { 'branch': 'main' }

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- For vsnip user.
  -- 'hrsh7th/cmp-vsnip',
  -- 'hrsh7th/vim-vsnip',
  -- 'hrsh7th/vim-vsnip-integ',

  -- For ultisnips users.
  'SirVer/ultisnips',
  'quangnguyen30192/cmp-nvim-ultisnips',

  -- coding
  'mattn/efm-langserver',
  {
    'creativenull/efmls-configs-nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  -- { 'jose-elias-alvarez/null-ls.nvim', dependencies = { "nvim-lua/plenary.nvim" } },

  -- coding - rust
  -- 'simrat39/rust-tools.nvim'

  -- coding - elixir
  'elixir-editors/vim-elixir',
  'elixir-tools/elixir-tools.nvim',
  -- {
  --   'elixir-tools/elixir-tools.nvim',
  --   -- version = "*",
  --   -- event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  -- 'florinpatrascu/vscode-elixir-snippets',

  -- -- coding - llm
  -- 'huggingface/llm.nvim',

  --
})

--     Plug 'derekwyatt/vim-fswitch'
--     " puppet - well, not really coding
--     Plug 'rodjek/vim-puppet'

--     " Elixir
--     Plug 'elixir-editors/vim-elixir'
--     " if has('nvim')
--     "     " Plug 'elixir-lang/tree-sitter-elixir', { 'branch': 'main' }
--     "     Plug 'florinpatrascu/vscode-elixir-snippets'
--     "     Plug 'elixir-tools/elixir-tools.nvim', { 'tag': 'stable' }
--     " endif

--     " Elm
--     " Plug 'ElmCast/elm-vim'
--     " " fix incompability
--     " let g:polyglot_disabled = ['elm']

--     " Golang
--     " Plug 'fatih/vim-go'

--     " Rust
--     " Plug 'rust-lang/rust.vim'

--     " Html
--     Plug 'mattn/emmet-vim'

--     " *-lang
--     Plug 'sheerun/vim-polyglot'
--     Plug 'tpope/vim-endwise'

--     " End
--     call plug#end()

--     " Load matchit.vim, but only if the user hasn't installed a newer version.
--     if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
--         runtime! macros/matchit.vim
--     endif
