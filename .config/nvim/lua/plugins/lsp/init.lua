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
        'saghen/blink.cmp',
        version = "1.*",
        opts = {
            keymap = {
                preset = 'enter',
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            completion = { documentation = { auto_show = true } }
        },
        opts_extend = { "sources.default" }
    },
}
