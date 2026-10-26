return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "ray-x/lsp_signature.nvim",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        -- { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- local nvim_lsp = require("lspconfig")
        -- local mason_lspconfig = require("mason-lspconfig")

        -- local protocol = require("vim.lsp.protocol")

        -- Single stable group; we only clear autocmds scoped to the current
        -- buffer when a new server attaches, so additional servers attaching
        -- elsewhere do not wipe format-on-save for previously-attached buffers.
        local format_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })

        local on_attach = function(client, bufnr)
            -- format on save
            -- vim.print(vim.inspect(client.server_capabilities))
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = format_group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        --  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.completion.completionItem.snippetSupport = true

        --- ```lua
        --- --Enable (broadcasting) snippet capability for completion
        --- local capabilities = vim.lsp.protocol.make_client_capabilities()
        --- capabilities.textDocument.completion.completionItem.snippetSupport = true
        ---
        --- vim.lsp.config('html', {
        ---   capabilities = capabilities,
        --- })
        --- ```

        -- local capabilitiesWithoutFomatting = capabilities
        -- capabilitiesWithoutFomatting.textDocument.formatting = false
        -- capabilitiesWithoutFomatting.textDocument.rangeFormatting = false
        -- capabilitiesWithoutFomatting.textDocument.range_formatting = false
        -- -- print(vim.inspect(capabilitiesWithoutFomatting.textDocument))

        -- print(vim.inspect(capabilities.textDocument))
        -- print(vim.inspect(capabilities))

        -- lspconfig - bash {{{
        vim.lsp.config('bashls', {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { 'bash-language-server', 'start' },
            filetypes = { 'bash', 'sh' },
            root_markers = { '.git' },
        })
        vim.lsp.enable('bashls')
        -- }}}

        -- lspconfig - python {{{
        vim.lsp.config('pyright', {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable('pyright')
        -- }}}

        -- lspconfig - puppet {{{
        vim.lsp.config('puppet', {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable('puppet')
        -- }}}

        -- lspconfig - yaml / json {{{
        vim.lsp.config('yamlls', {
            on_attach = on_attach,
            capabilities = capabilities,
            -- filetypes = { 'yaml', 'json' },
            settings = {
                yaml = {
                    -- schemaStore = { enable = true },
                    schemas = {
                        -- ["https://opencode.ai/config.json"] = "/opencode.json",
                        -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                        -- ["/path/from/root/of/project"] = "/.github/workflows/*",
                    },
                },
            }
        })
        vim.lsp.enable('yamlls')
        -- }}}

        -- lspconfig - lua {{{
        -- stolen from lspconfig docs
        vim.lsp.config('lua_ls', {
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
        vim.lsp.enable('lua_ls')
        -- }}}

        -- lspconfig - c/c++ {{{
        vim.lsp.config('clangd', {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { 'clangd' },
            filetypes = { 'c', 'cpp' },
            root_markers = { '.clangd', 'compile_commands.json' },
        })
        vim.lsp.enable('clangd')
        -- }}}

        -- lspconfig - rust {{{
        vim.lsp.config('rust_analyzer', {
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
        vim.lsp.enable('rust_analyzer')
        -- }}}

        -- lspconfig - efm - json/... {{{
        vim.lsp.config('efm', {
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
                            },
                            formatCommand = "jq .",
                            formatStdin = true
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
        vim.lsp.enable('efm')
        -- }}}

        -- lspconfig - elixir - expert {{{
        vim.lsp.config('expert', {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable('expert')
        -- }}}

        -- lspconfig - systemd {{{
        vim.lsp.config('systemd_ls', {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.enable('systemd_ls')
        -- }}}

        -- lspconfig - nix - nixd {{{
        vim.lsp.config('nixd', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                nixd = {
                    formatting = {
                        command = { "nixfmt" },
                    }
                }
            }
        })
        vim.lsp.enable('nixd')
        -- }}}

        -- lspconfig - nix - nil_ls {{{
        vim.lsp.config('nil_ls', {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable('nil_ls')
        -- }}}
        --
        -- lspconfig - qmlls {{{
        vim.lsp.config('qmlls', {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable('qmlls')
        -- }}}
    end,
}
