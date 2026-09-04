vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

return {
    require("plugins.treesitter"),
    require("plugins.nvimtree"),
    require("plugins.avante"),
    "nvim-tree/nvim-web-devicons",
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = 'shusia'
            vim.g.sonokai_better_performance = 1
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup {
                indent = {
                    char = '▏',
                },
                scope = { enabled = false }
            }
        end
    },
    {
        'nvim-mini/mini.nvim',
        version = false,
        config = function()
            require('mini.starter').setup()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup() end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    {
        "nvzone/floaterm",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = "FloatermToggle",
    },
    "unblevable/quick-scope",
    {
        "benomahony/uv.nvim",
        ft = { "python" },
        opts = {
            picker_integration = true,
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            win = {
                border = "none",
            },
            show_help = false,
            show_keys = false,
        },
        -- keys = {
        --     {
        --         "<leader>k",
        --         function()
        --             require("which-key").show({ global = false })
        --         end,
        --         desc = "Buffer Local Keymaps (which-key)",
        --     },
        -- },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
