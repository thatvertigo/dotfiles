local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer navigation
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

-- Buffer Split
map('n', '<leader>H', ':leftabove vnew<CR>', opts)  -- new buffer to the left
map('n', '<leader>L', ':rightbelow vnew<CR>', opts) -- new buffer to the right
map('n', '<leader>K', ':leftabove new<CR>', opts)   -- new buffer above
map('n', '<leader>J', ':rightbelow new<CR>', opts)  -- new buffer below

-- Toggling Tree
map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>ot", ":ToggleTerm<CR>", opts)

-- Searching
map("n", "<leader>ff", Snacks.picker.files, opts)

-- LSP
map("n", "<leader>?", vim.lsp.buf.hover, opts)
map('n', '<leader>e', vim.diagnostic.open_float, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)


