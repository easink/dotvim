return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        bind = true,
        hint_enable = false,
        -- floating_window = true,
        floating_window = false,
        floating_window_above_cur_line = false,
        handler_opts = {
            border = "rounded"
        }
    },
    -- or use config
    -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
}
