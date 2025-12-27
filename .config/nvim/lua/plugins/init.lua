return {
    require("plugins.treesitter"),
    require("plugins.nvimtree"),
    "nvim-tree/nvim-web-devicons",
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = 'shusia'
            vim.g.sonokai_better_performance = 1
        end,
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = function() require("ibl").setup {
        indent = {
            char = '▏',
        },
        scope = { enabled = false }
    } end },
    { 'nvim-mini/mini.nvim', version = false, config = function()
        require('mini.starter').setup()
    end },
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup() end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true}
}
