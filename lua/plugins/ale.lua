return {
    {
        'dense-analysis/ale',
        init = function()
            -- ALE {{{
            vim.g.ale_disable_lsp = 1

            vim.g.ale_use_neovim_diagnostics_api = 1

            -- Ale
            -- vim.g.ale_sign_error = '⤫'
            -- vim.g.ale_sign_warning = '⚠'

            vim.g.ale_echo_msg_format = '[%severity%] %s [%linter%][%code%]'

            -- vim.g:ale_linters = {'go': ['gometalinter']}
            --     " \ 'elixir': ['credo', 'dialyxir', 'elixir-ls', 'mix'],

            -- vim.g.ale_linters = {
            --   elixir = { 'credo', 'dialyxir', 'mix' },
            --   rust = { 'cargo', 'rls', 'rustc' },
            --   go = { 'gometalinter' }
            -- }

            vim.g.ale_fix_on_save = 1

            vim.g.ale_fixers = {
                -- elixir = { 'mix_format' },
                -- rust = { 'rustfmt' },
                -- python = { 'yapf' },
                ['*'] = { 'remove_trailing_lines', 'trim_whitespace' }
            }
            -- }}}
        end
    }
}
