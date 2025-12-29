-- Languages
languages ={
    'python',
    'zig',
    'lua'
} 

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- local configs = require 'nvim-treesitter.configs'
        local configs = require 'nvim-treesitter'
        configs.setup {
            ensure_installed = languages,
            highlight = {
                enable = true
            },
        }
    end,
}
