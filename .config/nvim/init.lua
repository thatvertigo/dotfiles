require("config.lazy")
require("config.binds")

vim.cmd('colorscheme sonokai')

vim.o.number = true
vim.o.cursorline = true

vim.api.nvim_set_option("clipboard","unnamedplus")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
