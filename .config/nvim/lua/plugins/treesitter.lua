-- Languages
languages ={
    'python',
    'zig',
    'lua'
} 

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require 'nvim-treesitter.configs'
        configs.setup {
        ensure_installed = languages,
            highlight = {
                enable = true
            },
        }
    end,
}
