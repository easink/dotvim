return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- local nvim_lsp = require("lspconfig")
        -- local mason_lspconfig = require("mason-lspconfig")

        -- local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            -- format on save
            -- vim.print(vim.inspect(client.server_capabilities))
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        --  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.completion.completionItem.snippetSupport = true
        -- local capabilitiesWithoutFomatting = capabilities
        -- capabilitiesWithoutFomatting.textDocument.formatting = false
        -- capabilitiesWithoutFomatting.textDocument.rangeFormatting = false
        -- capabilitiesWithoutFomatting.textDocument.range_formatting = false
        -- -- print(vim.inspect(capabilitiesWithoutFomatting.textDocument))

        -- print(vim.inspect(capabilities.textDocument))
        -- print(vim.inspect(capabilities))

        -- lspconfig - bash {{{
        require('lspconfig').bashls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- }}}

        -- lspconfig - python {{{
        require('lspconfig').pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- }}}

        -- lspconfig - puppet {{{
        require('lspconfig').puppet.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- }}}

        -- lspconfig - yaml / json {{{
        require('lspconfig').yamlls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
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
            on_attach = on_attach,
            capabilities = capabilities,
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
                        globals = { 'vim' },
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
        require('lspconfig').rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    -- rustfmt = { rangeFormatting = { enable = true } },
                    diagnostics = {
                        -- enable = false,
                        experimental = { enable = true },
                    }
                }
            }
        })
        -- }}}

        -- lspconfig - efm - json/... {{{
        -- steal from http://github.com/creativenull/efmls-configs-nvim/
        --    or from https://github.com/mattn/efm-langserver
        --    or from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#efm
        require('lspconfig').efm.setup({
            on_attach = on_attach,
            capabilities = capabilities,
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
            -- filetypes = { 'elixir', 'markdown', 'python' },
            filetypes = { 'elixir', 'json', 'markdown' },
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
                    elixir = {
                        {
                            -- prefix = 'jq',
                            lintCommand = "mix credo suggest --format=flycheck --read-from-stdin ${INPUT}",
                            lintStdin = true,
                            lintFormats = {
                                '%f:%l:%c: %t: %m',
                                '%f:%l: %t: %m',
                            },
                            rootMarkers = {
                                'mix.lock',
                                'mix.exs',
                            }
                        }
                    },
                    json = {
                        {
                            prefix = 'jq',
                            lintCommand = 'jq .',
                            lintStdin = true,
                            lintFormats = {
                                'parse %trror: %m at line %l, column %c',
                                '%m',
                            }
                        }
                    },
                    markdown = {
                        -- {
                        --   prefix = 'markdownlint',
                        --   lintCommand = 'markdownlint --stdin',
                        --   lintStdin = true,
                        --   lintIgnoreExitCode = true,
                        --   lintFormats = {
                        --     '%f:%l %m',
                        --     '%f:%l:%c %m',
                        --     '%f: %l: %m',
                        --     '%m',
                        --   }
                        -- },
                        {
                            formatCommand = 'pandoc -s -f markdown -t gfm -sp --tab-stop=2',
                            formatStdin = true,
                        },
                    },
                }
            }
        })
        -- }}}

        -- elixir {{{

        -- local path_to_elixirls = vim.fn.expand("~/bin/language_server.sh")

        -- require('lspconfig').elixirls.setup({
        --     -- cmd = { path_to_elixirls },
        --     cmd = { "elixir-ls" },
        --     capabilities = capabilities,
        --     settings = {
        --         elixirLS = {
        --             -- I choose to disable dialyzer for personal reasons, but
        --             -- I would suggest you also disable it unless you are well
        --             -- aquainted with dialzyer and know how to use it.
        --             dialyzerEnabled = false,
        --             -- I also choose to turn off the auto dep fetching feature.
        --             -- It often get's into a weird state that requires deleting
        --             -- the .elixir_ls directory and restarting your editor.
        --             fetchDeps = false,
        --             enableTestLenses = true,
        --             suggestSpecs = false
        --         }
        --     },
        --     on_attach = function(_, _)
        --         vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
        --         vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
        --         vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        --     end,
        -- })

        -- elixir.setup({
        --   nextls = {
        --     enable = false,
        --     -- -- cmd = vim.fn.expand("~/.nix-profile/burrito_out/next_ls_linux_amd64"),
        --     -- cmd = vim.fn.expand("~/.nix-profile/bin/nextls"),
        --   },
        --   credo = { enable = false },
        --   elixirls = {
        --     enable = true,
        --     cmd = elixirls_path,
        --     -- tag = 'v0.24.1',

        --     -- default settings, use the `settings` function to override settings
        --     settings = elixirls.settings {
        --       dialyzerEnabled = false,
        --       fetchDeps = false,
        --       enableTestLenses = false,
        --       suggestSpecs = false,
        --     },
        --     -- on_attach = function(client, bufnr)
        --     on_attach = function(_, _)
        --       vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>",    { buffer = true, noremap = true })
        --       vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>",      { buffer = true, noremap = true })
        --       vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        --     end
        --   }
        -- })

        -- }}}

        -- lspconfig - elixir - lexical-ls {{{
        -- LEXICAL local lspconfig = require("lspconfig")
        -- LEXICAL local configs = require("lspconfig.configs")
        -- LEXICAL
        -- LEXICAL local lexical_ls_path = vim.fn.expand("~/source/language_server/lexical/_build/prod/package/lexical/bin/start_lexical.sh")
        -- LEXICAL -- local lexical_ls_path = vim.fn.expand("~/bin/start_lexical.sh")
        -- LEXICAL -- local lexical_ls_path = vim.fn.expand("~/.nix-profile/bin/start_lexical.sh")
        -- LEXICAL local lexical_config = {
        -- LEXICAL   filetypes = { "elixir", "eelixir", "heex" },
        -- LEXICAL   cmd = { lexical_ls_path },
        -- LEXICAL   settings = {},
        -- LEXICAL }
        -- LEXICAL
        -- LEXICAL if not configs.lexical then
        -- LEXICAL   configs.lexical = {
        -- LEXICAL     default_config = {
        -- LEXICAL       filetypes = lexical_config.filetypes,
        -- LEXICAL       cmd = lexical_config.cmd,
        -- LEXICAL       root_dir = function(fname)
        -- LEXICAL         return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
        -- LEXICAL       end,
        -- LEXICAL       -- optional settings
        -- LEXICAL       settings = lexical_config.settings,
        -- LEXICAL     },
        -- LEXICAL   }
        -- LEXICAL end
        -- LEXICAL
        -- LEXICAL lspconfig.lexical.setup({})
        -- }}}

        -- lspconfig - nix - nixd {{{
        require('lspconfig')['nixd'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- }}}

        -- lspconfig - nix - nil_ls {{{
        require('lspconfig')['nil_ls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- }}}
    end,
}
