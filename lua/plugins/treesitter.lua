--  vim: set foldlevel=0 spell:

return {
    -- nvim-tree-sitter {{{
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'RRethy/nvim-treesitter-endwise',
            "windwp/nvim-ts-autotag",
        },
        opts = {
            ensure_installed = "all",
            -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            ignore_install = { "astro", "org", "fortran", "hack", "wgsl", "wgsl_bevy" }, -- List of parsers to ignore installing
            indent = { enable = true },
            autotag = { enable = true },
            highlight = {
                enable = true, -- false will disable the whole extension
                -- disable = { "wgsl", "wgsl_bevy" },  -- list of language that will be disabled
                -- disable = { "c", "rust", "elixir" },  -- list of language that will be disabled
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = { enable = true },
            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        -- Or you can define your own textobjects like this
                        -- ["iF"] = {
                        --   python = "(function_definition) @function",
                        --   cpp = "(function_definition) @function",
                        --   c = "(function_definition) @function",
                        --   java = "(method_declaration) @function",
                        -- },
                    },
                },
            },
            refactor = {
                -- highlight_definitions = {
                --   enable = true,
                --   -- Set to false if you have an `updatetime` of ~100.
                --   clear_on_cursor_move = true,
                -- },
                -- highlight_current_scope = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "grr",
                    },
                },
            },
            endwise = {
                enable = true,
            },
        }
    },
    -- }}}

}
