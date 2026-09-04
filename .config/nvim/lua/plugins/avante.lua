return {
    "avante-corp/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false,
    opts = function()
        return {
            provider = "claude-code",
            acp_providers = {
                ["claude-code"] = {
                    env = {
                        CLAUDE_CODE_OAUTH_TOKEN = require("secret")
                            .CLAUDE_CODE_OAUTH_KEY,
                    },
                },
            },
            providers = {
                claude = {
                    parse_api_key = function()
                        return require("secret").ANTHROPIC_API_KEY
                    end,
                    extra_headers = {
                        ["anthropic-workspace-id"] = require("secret")
                            .ANTHROPIC_WORKSPACE_ID,
                    },
                },
            },
            behaviour = {
                auto_set_keymaps = true,
            },
        }
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-mini/mini.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim",
    },
}
