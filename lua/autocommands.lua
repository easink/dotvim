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

-- local my_formatexpr_wrapper = function(filter)
--   -- only reformat on explicit gq command
--   if not vim.fn.mode() == 'n' then
--      -- fall back to Vims internal reformatting
--      return 1
--   end

--   -- local opts = {}
--   local lstart = vim.v.lnum
--   local lend = lstart + vim.v.count - 1
--   if lstart >= 0 and lend >= 0 then
--     -- lsp.buf.range_formatting(opts, {start_line, 0}, {end_line, 0})
--     local command = lstart .. ',' .. lend .. '!' .. filter
--     vim.cmd({ cmd = 'echo', args = { command } })
--     vim.cmd(command)
--   end

--   return 0
-- end

-- Remember info about open buffers on close
--     " set viminfo^=%

-- -- Use local formatexpr instead of gloabl formatprg, stolen from Drew Neil
-- vim.cmd [[
-- function! FormatprgLocal(filter)
--     if !empty(v:char)
--         return 1
--     else
--         let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
--         echo l:command
--         execute l:command
--     endif
-- endfunction
-- ]]

-- local format_prg_local = function(filter)
--     -- buffer ( 0 = current )
--     -- local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     -- local command = row .. ',.' .. (row + v:count - 1) .. '!' .. filter

--     local command = '!' .. filter
--     vim.cmd('echo xxx ' .. command)
--     -- vim.command(command)
-- end

--     " C {
--         function FT_C()
--             set autowrite
--             "set noexpandtab
--             set tabstop=4
--             set shiftwidth=4

--             set cindent
--             set cino=(0,:0
--             "         |  +--------- case placement
--             "         +------------ second line parameter placement
--             set autoindent
--             set smartindent
--             set sm smd
--             " set nomesg sm smd
--             set fo=croq

--             " Complete options (disable preview scratch window)
--             " set completeopt=menuone,preview
--             " set completeopt-=preview
--             " Limit popup menu height
--             set pumheight=15

--             if has("insert_expand")
--                     set showfulltag
--             endif

--             " Makes ctrl-g show the buffer # as well.
--             noremap <C-G> 2<C-G>
--         endfunction
--         au BufRead,BufNewFile *.c,*.h call FT_C()
--         " linux kernel at $HOME/source/linux.git/*
--         autocmd BufNewFile,BufRead $HOME/source/linux.git/* set tabstop=8 shiftwidth=8 columns=80 colorcolumn=81 nolist

--     " }

-- Markdown {{{
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function(_)
        -- print('event fired: ' .. vim.inspect(ev))
        vim.opt_local.formatprg = 'pandoc -s -f markdown -t gfm -sp --tab-stop=2'
    end
})
-- }}}

--     " HTML {
--         au FileType html setlocal formatexpr=FormatprgLocal('pandoc\ -f\ html\ -t\ html')
--         " au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format\ --html\ --xmlout')
--     " }
--     " XML {
--         au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format')
--     " }
--     " Elixir {
--         au FileType elixir setlocal formatexpr=FormatprgLocal('mix\ --format\ -')
--     " }
--     " Python {
--         " Tests
--         au FileType python nnoremap <localleader>t :!nose2<cr>
--     " }
--     " Ruby {
--         " ruby standard 2 spaces, always
--         au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
--         au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
--     " }
--     " Mail {
--         au BufRead,BufNewFile *mutt-* set filetype=mail
--     " }
--     " Notes {
--         " I consider .notes files special, and handle them differently, I
--         " should probably put this in another file
--         au BufRead,BufNewFile *.notes set foldlevel=2
--         au BufRead,BufNewFile *.notes set foldmethod=indent
--         au BufRead,BufNewFile *.notes set tabstop=8
--         au BufRead,BufNewFile *.notes set syntax=notes
--         au BufRead,BufNewFile *.notes set nocursorcolumn
--         au BufRead,BufNewFile *.notes set nocursorline
--         au BufRead,BufNewFile *.notes set guifont=Consolas:h12
--         au BufRead,BufNewFile *.notes set spell
--     " }
--     au BufNewFile,BufRead *.ahk setf ahk
-- }}}
