lsps = {
    "lua_ls"
}

return {
    { 'mason-org/mason.nvim', opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = lsps,
      },
      dependencies = { "mason-org/mason.nvim"},
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
    { 'saghen/blink.cmp', version = "1.*", opts = { 
        keymap = { 
            preset = 'enter',
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        completion = { documentation = { auto_show = true } }
    }, opts_extend = { "sources.default" } },
    -- { 'hrsh7th/nvim-cmp', dependencies = { 'onsails/lspkind.nvim', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline' }, config = function()
    --       -- Set up nvim-cmp.
    --      local cmp = require'cmp'

    --      cmp.setup({
    --        formatting = {
    --          fields = { "kind", "abbr", "menu" },
    --          format = function(entry, vim_item)
    --            local kind = require("lspkind").cmp_format({ mode = "symbol", maxwidth = 50 })(entry, vim_item)
    --            local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --            kind.kind = "" .. (strings[1] or "") .. ""
    --            -- kind.menu = "    (" .. (strings[2] or "") .. ")"
    --            return kind
    --          end,
    --        },
    --        snippet = {
    --          -- REQUIRED - you must specify a snippet engine
    --          expand = function(args)
    --            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    --          end,
    --        },
    --        window = {
    --          -- completion = cmp.config.window.bordered(),
    --          -- documentation = cmp.config.window.bordered(),
    --        },
    --        mapping = cmp.mapping.preset.insert({
    --          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --          ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --          ['<C-Space>'] = cmp.mapping.complete(),
    --          ['<C-e>'] = cmp.mapping.abort(),
    --          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --          ["<Tab>"] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             else
    --                 fallback()
    --             end
    --          end, { "i", "s" }),
    --          ["<S-Tab>"] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_prev_item()
    --             else
    --                 fallback()
    --             end
    --          end, { "i", "s" }),
    --        }),
    --        sources = cmp.config.sources({
    --          { name = 'nvim_lsp' },
    --        }, {
    --          { name = 'buffer' },
    --        })
    --      })

    --      -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    --      -- Set configuration for specific filetype.
    --      --[[ cmp.setup.filetype('gitcommit', {
    --        sources = cmp.config.sources({
    --          { name = 'git' },
    --        }, {
    --          { name = 'buffer' },
    --        })
    --     })
    --     require("cmp_git").setup() ]]--

    --      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    --      cmp.setup.cmdline({ '/', '?' }, {
    --        mapping = cmp.mapping.preset.cmdline(),
    --        sources = {
    --          { name = 'buffer' }
    --        }
    --      })

    --      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --      cmp.setup.cmdline(':', {
    --        mapping = cmp.mapping.preset.cmdline(),
    --        sources = cmp.config.sources({
    --          { name = 'path' }
    --        }, {
    --          { name = 'cmdline' }
    --        }),
    --        matching = { disallow_symbol_nonprefix_matching = false }
    --      })

    --      -- Set up lspconfig.
    --      local capabilities = require('cmp_nvim_lsp').default_capabilities()
    --      vim.lsp.config('lua_ls', {
    --        capabilities = capabilities
    --      })
    --      vim.lsp.enable('lua_ls')
    --      vim.lsp.config('haskell-language-server', {
    --        capabilities = capabilities
    --      })
    --      vim.lsp.enable('haskell-language-server')
    -- end },
    -- {
    --     'mrcjkb/haskell-tools.nvim',
    --     dependencies = { "hrsh7th/cmp-nvim-lsp" },
    --     version = '^6', -- Recommended
    --     lazy = false, -- This plugin is already lazy
    -- }
}
