-- lsp.lua
--  vim: foldlevel=0 spell:

vim.lsp.set_log_level("debug")

-- vim.keymap.set('v', '<leader>f', vim.lsp.buf.format, { buffer = true })
-- vim.keymap.set('v', '<leader>1f', vim.lsp.buf.format, bufopts)

function MyFormat()
  vim.lsp.buf.format({
    async = true,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end

-- cmp {{{
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-n>'] = cmp.mapping.goto_next(),
    -- ['<C-p>'] = cmp.mapping.goto_prev(),
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping.confirm({
        -- behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Set up lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- print(vim.inspect(capabilities.textDocument))

-- local capabilitiesWithoutFomatting = capabilities
-- capabilitiesWithoutFomatting.textDocument.formatting = false
-- capabilitiesWithoutFomatting.textDocument.rangeFormatting = false
-- capabilitiesWithoutFomatting.textDocument.range_formatting = false
-- -- print(vim.inspect(capabilitiesWithoutFomatting.textDocument))

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--}


-- }}}

-- null-ls {{{

-- NULL-LS local null_ls = require('null-ls')
-- NULL-LS -- require('null-ls.my_markdown')
-- NULL-LS require('null-ls-config.my_markdown')
-- NULL-LS
-- NULL-LS null_ls.setup({
-- NULL-LS   debug = true,
-- NULL-LS   sources = {
-- NULL-LS     -- code actions
-- NULL-LS     -- null_ls.builtins.code_actions.shellcheck,
-- NULL-LS
-- NULL-LS     -- completion
-- NULL-LS     -- null_ls.builtins.completion.vsnip,
-- NULL-LS
-- NULL-LS     -- diagnostics
-- NULL-LS     -- null_ls.builtins.diagnostics.checkmake,
-- NULL-LS     -- null_ls.builtins.diagnostics.clang_check,
-- NULL-LS     -- null_ls.builtins.diagnostics.credo,
-- NULL-LS     -- null_ls.builtins.diagnostics.markdownlint,
-- NULL-LS     -- null_ls.builtins.diagnostics.mypy,
-- NULL-LS     -- null_ls.builtins.diagnostics.shellcheck,
-- NULL-LS     -- null_ls.builtins.diagnostics.yamllint,
-- NULL-LS
-- NULL-LS     -- formatting
-- NULL-LS     -- null_ls.builtins.formatting.jq,
-- NULL-LS     -- null_ls.builtins.formatting.markdownlint,
-- NULL-LS     -- null_ls.builtins.formatting.mix,
-- NULL-LS     null_ls.my_markdown,
-- NULL-LS
-- NULL-LS     -- hover
-- NULL-LS   },
-- NULL-LS })

-- }}}

-- lspconfig - bash {{{
require('lspconfig').bashls.setup({})
-- }}}

-- lspconfig - python {{{
require('lspconfig').pyright.setup({})
-- }}}

-- lspconfig - yaml / json {{{
require('lspconfig').yamlls.setup({
  -- settings = {
  --   yaml = {
  --     -- schemaStore = { enable = true },
  --     -- schemas = {
  --     --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
  --     --   ["../path/relative/to/file.yml"] = "/.github/workflows/*",
  --     --   ["/path/from/root/of/project"] = "/.github/workflows/*",
  --     -- },
  --   },
  -- }
})
-- }}}

-- lspconfig - lua {{{
-- stolen from lspconfig docs
require('lspconfig').lua_ls.setup({
  -- on_attach = function()
  --   on_attach()
  --   vim.cmd [[autocmd BufWritePre <buffer> lua require'stylua-nvim'.format_file()]]
  -- end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
-- }}}

-- lspconfig - rust {{{
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      -- rustfmt = { rangeFormatting = { enable = true } },
      diagnostics = {
        -- enable = false,
        experimental = { enable = true },
      }
    }
  }
}
-- }}}

-- print(vim.inspect(capabilities.textDocument))

-- print(vim.inspect(capabilities))
-- lspconfig - efm - json/... {{{
-- steal from http://github.com/creativenull/efmls-configs-nvim/
--    or from https://github.com/mattn/efm-langserver
require('lspconfig')['efm'].setup({
  -- initializationOptions = {
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  -- capabilities = capabilities,
  -- on_attach = function(client)
  --    if client.server_capabilities.document_range_formatting then
  --       -- vim.keymap.set("v", "<leader>=", format_buffer, { buffer = bufnr })
  --       print("YYYYYYYYYYYYYY")
  --   else
  --       print("NNNNNNNNNNNNNNN")
  --   end
    -- print(vim.inspect(client.server_capabilities))

  --       -- local keyset={}
  --       -- local n=0

  --       -- for k,v in pairs(client) do
  --       --   n=n+1
  --       --   keyset[n]=k
  --       -- end

  --       print(vim.inspect(client.server_capabilities))
  --       -- print(vim.inspect(keyset))
  -- end,
  -- filetypes = {'markdown'},

  settings = {
    -- version = 2,
    -- logFile = "/tmp/output.log",
    -- logLevel = 1,
    rootMarkers = { '.git/' },
    languages = {
      -- yaml = {
      --   {
      --     prefix = 'yamllint',
      --     lintCommand = 'yamllint --format parsable -',
      --     lintStdin = true,
      --   }
      -- },
      -- sh = {
      --   {
      --     prefix = 'shellcheck',
      --     -- lintCommand = 'shellcheck -f gcc -x',
      --     lintCommand = 'shellcheck --color=never --format gcc --external-sources -',
      --     lintStdin= true,
      --     lintFormats = {
      --       '-:%l:%c: %trror: %m',
      --       '-:%l:%c: %tarning: %m',
      --       '-:%l:%c: %tote: %m',
      --       '%m',
      --     }
      --   }
      -- },
      json = {
        {
          prefix = 'jq',
          lintCommand = 'jq .',
          lintStdin= true,
          lintFormats = {
            'parse %trror: %m at line %l, column %c',
            '%m',
          }
        }
      },
      -- markdown = {
      --   -- {
      --   --   prefix = 'markdownlint',
      --   --   lintCommand = 'markdownlint --stdin',
      --   --   lintStdin = true,
      --   --   lintIgnoreExitCode = true,
      --   --   lintFormats = {
      --   --     '%f:%l %m',
      --   --     '%f:%l:%c %m',
      --   --     '%f: %l: %m',
      --   --     '%m',
      --   --   }
      --   -- },
      --   {
      --     formatCommand = 'pandoc -s -f markdown -t gfm -sp --tab-stop=2',
      --     formatStdin = true,
      --   },
      -- },
    }
  }
})
-- }}}

--- elixir {{{

-- local path_to_elixirls = vim.fn.expand("~/bin/language_server.sh")

-- lspconfig.elixirls.setup({
--   cmd = {path_to_elixirls},
--   capabilities = capabilities,
--    on_attach = on_attach,
--   settings = {
--     elixirLS = {
--       -- I choose to disable dialyzer for personal reasons, but
--       -- I would suggest you also disable it unless you are well
--       -- aquainted with dialzyer and know how to use it.
--       dialyzerEnabled = false,
--       -- I also choose to turn off the auto dep fetching feature.
--       -- It often get's into a weird state that requires deleting
--       -- the .elixir_ls directory and restarting your editor.
--       fetchDeps = false
--     }
--   }
-- })

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

-- local elixirls_path = vim.fn.expand("~/bin/language_server.sh")

elixir.setup({
  nextls = {
    enable = true,
    -- cmd = vim.fn.expand("~/.nix-profile/burrito_out/next_ls_linux_amd64"),
    cmd = vim.fn.expand("~/.nix-profile/bin/nextls"),
  },
  credo = { enable = false },
  elixirls = {
    enable = true,
    -- cmd = elixirls_path,
    tag = 'v0.17.7',

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = false,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    -- on_attach = function(client, bufnr)
    on_attach = function(_, _)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>",    { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>",      { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
})

-- }}}

-- LEXICAL-LS -- lspconfig - elixir - lexical-ls {{{
-- LEXICAL-LS local lspconfig = require("lspconfig")
-- LEXICAL-LS local configs = require("lspconfig.configs")
-- LEXICAL-LS
-- LEXICAL-LS -- local lexical_ls_path = vim.fn.expand("~/bin/start_lexical.sh")
-- LEXICAL-LS local lexical_ls_path = vim.fn.expand("~/.nix-profile/bin/start_lexical.sh")
-- LEXICAL-LS local lexical_config = {
-- LEXICAL-LS   filetypes = { "elixir", "eelixir", "heex" },
-- LEXICAL-LS   cmd = { lexical_ls_path },
-- LEXICAL-LS   settings = {},
-- LEXICAL-LS }
-- LEXICAL-LS
-- LEXICAL-LS if not configs.lexical then
-- LEXICAL-LS   configs.lexical = {
-- LEXICAL-LS     default_config = {
-- LEXICAL-LS       filetypes = lexical_config.filetypes,
-- LEXICAL-LS       cmd = lexical_config.cmd,
-- LEXICAL-LS       root_dir = function(fname)
-- LEXICAL-LS         return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
-- LEXICAL-LS       end,
-- LEXICAL-LS       -- optional settings
-- LEXICAL-LS       settings = lexical_config.settings,
-- LEXICAL-LS     },
-- LEXICAL-LS   }
-- LEXICAL-LS end
-- LEXICAL-LS
-- LEXICAL-LS lspconfig.lexical.setup({})
-- LEXICAL-LS -- }}}

-- LLM-LS -- llm-ls {{{
-- LLM-LS local llm = require('llm')
-- LLM-LS
-- LLM-LS llm.setup({
-- LLM-LS     api_token = nil,           -- cf Install paragraph
-- LLM-LS     model = "bigcode/starcoder", -- can be a model ID or an http(s) endpoint
-- LLM-LS     model_eos = "<|endoftext|>", -- needed to clean the model's output
-- LLM-LS     -- parameters that are added to the request body
-- LLM-LS     query_params = {
-- LLM-LS         max_new_tokens = 60,
-- LLM-LS         temperature = 0.2,
-- LLM-LS         top_p = 0.95,
-- LLM-LS         stop_tokens = nil,
-- LLM-LS     },
-- LLM-LS     -- set this if the model supports fill in the middle
-- LLM-LS     fim = {
-- LLM-LS         enabled = true,
-- LLM-LS         prefix = "<fim_prefix>",
-- LLM-LS         middle = "<fim_middle>",
-- LLM-LS         suffix = "<fim_suffix>",
-- LLM-LS     },
-- LLM-LS     debounce_ms = 150,
-- LLM-LS     accept_keymap = "<Tab>",
-- LLM-LS     dismiss_keymap = "<S-Tab>",
-- LLM-LS     max_context_after = 5000,
-- LLM-LS     max_context_before = 5000,
-- LLM-LS     tls_skip_verify_insecure = false,
-- LLM-LS     -- llm-ls integration
-- LLM-LS     lsp = {
-- LLM-LS         enabled = true,
-- LLM-LS         -- bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/llm_nvim/bin/llm-ls",
-- LLM-LS         bin_path = "/home/andreas/source/language_server/llm-ls/target/release/llm-ls",
-- LLM-LS     },
-- LLM-LS     tokenizer_path = nil, -- when setting model as a URL, set this var
-- LLM-LS     context_window = 8192, -- max number of tokens for the context window
-- LLM-LS })
-- LLM-LS
-- LLM-LS -- }}}

-- old stuff {{{

-- -- A callback that will get called when a buffer connects to the language server.
-- -- Here we create any key maps that we want to have on that buffer.
-- local on_attach = function(_, bufnr)
--   local function map(...)
--     vim.api.nvim_buf_set_keymap(bufnr, ...)
--   end
--   local map_opts = {noremap = true, silent = true}

--   -- map("n", "df", "<cmd>lua vim.lsp.buf.formatting()<cr>", map_opts)
--   -- map("n", "gd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", map_opts)
--   map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
--   -- map("n", "gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
--   -- map("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
--   map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
--   map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
--   map("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", map_opts)
--   map("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)

  -- These have a different style than above because I was fiddling
  -- around and never converted them. Instead of converting them
  -- now, I'm leaving them as they are for this article because this is
  -- what I actually use, and hey, it works ¯\_(ツ)_/¯.

  -- Expand
  -- vim.cmd [[imap <expr> <C-j> vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
  -- vim.cmd [[smap <expr> <C-j> vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]

  -- vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  -- vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

  -- vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  -- vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  -- vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
  -- vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]

  -- vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
  -- vim.cmd [[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]
  -- vim.cmd [[inoremap <silent><expr> <C-e> compe#close('<C-e>')]]
  -- vim.cmd [[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]]
  -- vim.cmd [[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]]

-- })


-- lspconfig.efm.setup({
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {
--                 {formatCommand = "lua-format -i", formatStdin = true}
--             }
--         }
--     }
-- })

-- -- local rt = require("rust-tools")

-- -- local opts = {
-- --   -- other configurations
-- --   server = {
-- --     on_attach = on_attach,
-- --     settings = {
-- --       ['rust-analyzer'] = {
-- --         cargo = {
-- --           autoReload = true,
-- --           noSysroot = true
-- --         }
-- --       }
-- --     }
-- --   }
-- -- }

-- -- rt.setup(opts)
-- -- lspconfig.rust_analyzer.setup({
-- --     on_attach=on_attach,
-- --     settings = {
-- --         ["rust-analyzer"] = {
-- --             imports = {
-- --                 granularity = {
-- --                     group = "module",
-- --                 },
-- --                 prefix = "self",
-- --             },
-- --             cargo = {
-- --                 noSysroot = true,
-- --                 buildScripts = {
-- --                     enable = true,
-- --                 },
-- --             },
-- --             procMacro = {
-- --                 enable = true
-- --             },
-- --         }
-- --     }
-- -- })

-- -- rust-analyzer.cargo.noSysroot

-- local opts = {
--   tools = {
--     runnables = {
--       use_telescope = true,
--     },
--     inlay_hints = {
--       auto = true,
--       show_parameter_hints = false,
--       parameter_hints_prefix = "",
--       other_hints_prefix = "",
--     },
--   },

--   -- all the opts to send to nvim-lspconfig
--   -- these override the defaults set by rust-tools.nvim
--   -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
--   server = {
--     -- on_attach is a callback called when the language server attachs to the buffer
--     on_attach = on_attach,
--     settings = {
--       -- to enable rust-analyzer settings visit:
--       -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--       ["rust-analyzer"] = {
--         -- enable clippy on save
--         checkOnSave = {
--           command = "clippy",
--         },
--       },
--     },
--   },
-- }

-- require("rust-tools").setup(opts)
-- -- local opts = {
-- --   -- rust-tools options
-- --   tools = {
-- --     autoSetHints = true,
-- --     hover_with_actions = true,
-- --     inlay_hints = {
-- --       show_parameter_hints = true,
-- --       parameter_hints_prefix = "",
-- --       other_hints_prefix = "",
-- --       },
-- --     },

-- --   -- all the opts to send to nvim-lspconfig
-- --   -- these override the defaults set by rust-tools.nvim
-- --   -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
-- --   -- https://rust-analyzer.github.io/manual.html#features
-- --   server = {
-- --     settings = {
-- --       ["rust-analyzer"] = {
-- --         assist = {
-- --           importEnforceGranularity = true,
-- --           importPrefix = "crate"
-- --           },
-- --         cargo = {
-- --           allFeatures = true
-- --           },
-- --         checkOnSave = {
-- --           -- default: `cargo check`
-- --           command = "clippy"
-- --           },
-- --       },
-- --       inlayHints = {
-- --         lifetimeElisionHints = {
-- --           enable = true,
-- --           useParameterNames = true
-- --         },
-- --       },
-- --     }
-- --   },
-- -- }

-- -- require('rust-tools').setup(opts)

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         -- Enable underline, use default values
--         -- underline = true,
--         -- Enable virtual text, override spacing to 4
--         virtual_text = true,
--         -- Disable a feature
--         -- update_in_insert = false,
--     })

-- }}}

-- Keybindings {{{

----------------- local range_formatting = function()
-----------------     local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
-----------------     local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
-----------------     vim.lsp.buf.format({
-----------------         range = {
-----------------             ["start"] = { start_row, 0 },
-----------------             ["end"] = { end_row, 0 },
-----------------         },
-----------------         async = true,
-----------------     })
----------------- end
-----------------
----------------- vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- print("LspAttach")
    -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- if client.server_capabilities.document_range_formatting then
    -- print(vim.inspect(client.server_capabilities))
    -- end

    -- print(vim.inspect(ev))
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- vim.bo[ev.buf].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
    -- vim.bo[ev.buf].formatexpr = nil

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

    vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
      -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    vim.keymap.set({'n', 'v'}, '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- }}}
