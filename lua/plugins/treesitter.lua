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
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = "all",
            -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            ignore_install = { "astro", "org", "fortran", "hack", "wgsl", "wgsl_bevy" }, -- List of parsers to ignore installing
            -- auto_install = true,
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
                        -- @block.inner
                        -- @block.outer
                        -- @class.inner
                        -- @class.outer
                        -- @comment.inner
                        -- @comment.outer
                        -- Or you can define your own textobjects like this
                        -- ["iF"] = {
                        --   python = "(function_definition) @function",
                        --   cpp = "(function_definition) @function",
                        --   c = "(function_definition) @function",
                        --   java = "(method_declaration) @function",
                        -- },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        -- ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                        ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
                        ["]c"] = { query = "@class.outer", desc = "Next class start" },
                        -- ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        -- ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        -- ["]F"] = { query = "@call.outer", desc = "Next function call end" },
                        ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
                        ["]C"] = { query = "@class.outer", desc = "Next class end" },
                        -- ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                        -- ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                    },
                    goto_previous_start = {
                        -- ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                        ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
                        ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                        -- ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                        -- ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
                    },
                    goto_previous_end = {
                        -- ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
                        ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
                        ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                        -- ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                        -- ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
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
