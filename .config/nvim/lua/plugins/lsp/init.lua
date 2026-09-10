lsps = {
    "lua_ls"
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
})

return {
    { 'mason-org/mason.nvim', opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = lsps,
        },
        dependencies = { "mason-org/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN] = '',
                        [vim.diagnostic.severity.INFO] = '',
                        [vim.diagnostic.severity.HINT] = '󰌵',
                    },
                    virtual_text = true,
                    virtual_lines = { current_line = true },
                    -- underline = true,
                    -- update_in_insert = false
                },
            })
        end,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "saghen/blink.compat",
        },
        version = "1.*",

        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },

            completion = {
                documentation = {
                    auto_show = true,
                },
            },

            sources = {
                default = {
                    "avante_commands",
                    "avante_mentions",
                    "avante_shortcuts",
                    "avante_files",

                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },

                providers = {
                    avante_commands = {
                        name = "avante_commands",
                        module = "blink.compat.source",
                        score_offset = 90,
                        opts = {},
                    },

                    avante_files = {
                        name = "avante_files",
                        module = "blink.compat.source",
                        score_offset = 100,
                        opts = {},
                    },

                    avante_mentions = {
                        name = "avante_mentions",
                        module = "blink.compat.source",
                        score_offset = 1000,
                        opts = {},
                    },

                    avante_shortcuts = {
                        name = "avante_shortcuts",
                        module = "blink.compat.source",
                        score_offset = 1000,
                        opts = {},
                    },
                },
            },
        },

        opts_extend = { "sources.default" },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
