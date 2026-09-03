vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

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
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        opts = {
            adapters = {
                acp = {
                    claude_code = function()
                        return require("codecompanion.adapters").extend("claude_code", {
                            env = {
                                CLAUDE_CODE_OAUTH_TOKEN = require("secret")
                                    .CLAUDE_CODE_OAUTH_KEY,
                            },
                        })
                    end,
                },
                http = {
                    anthropic = function()
                        return require("codecompanion.adapters").extend("anthropic", {
                            env = {
                                api_key = require("secret").ANTHROPIC_API_KEY,
                                ["anthropic-workspace-id"] = require("secret").ANTHROPIC_WORKSPACE_ID
                            },
                        })
                    end,
                },
            },
            interactions = {
                chat = {
                    adapter = "claude_code",
                },
                cli = {
                    agent = "claude_code",
                    agents = {
                        claude_code = {
                            cmd = "claude",
                            args = {},
                            description = "Claude Code CLI",
                            provider = "terminal",
                        },
                    },
                },
                inline = {
                    adapter = "anthropic",
                },
                cmd = {
                    adapter = "anthropic",
                },
            },
        },
        keys = {
            { "<leader>a",  group = "CodeCompanion" },
            { "<leader>ac", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
            { "<leader>ao", "<cmd>CodeCompanionCLI<cr>",     desc = "CodeCompanion CLI" },
            { "<leader>ai", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion Inline" },
            { "<leader>am", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion Cmd" },
            { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
