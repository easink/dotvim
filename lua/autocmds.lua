-- autocommands.lua
--  vim: foldlevel=0 spell:

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { '*' },
    command = [[
        if line("'\"") > 0 && line("'\"") <= line("$") |
          exe "normal g'\"" |
        endif
    ]]
})

local trim_group = vim.api.nvim_create_augroup('TrimOnSave', { clear = true })

-- Trim trailing whitespaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = trim_group,
    callback = function()
        vim.cmd([[keepjumps keeppatterns silent! %s/\s\+$//e]])
    end,
})

-- Trim trailing blank lines on save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = trim_group,
    callback = function()
        local windowView = vim.fn.winsaveview()

        vim.cmd([[:keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d_]])

        if windowView ~= nil then
            vim.fn.winrestview(windowView)
        end
    end,
})
