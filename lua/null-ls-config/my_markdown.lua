local null_ls = require("null-ls")
-- local helpers = require("null-ls.helpers")
-- local methods = require("null-ls.methods")

local my_markdown = {
    name = "my_markdown",
    method = null_ls.methods.FORMATTING,
    filetypes = { "markdown" },
    generator = null_ls.formatter({
        command = "sed",
        args = { "s/a/_/g" },
        to_stdin = true,
    }),
}

null_ls.register(my_markdown)
