return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",                -- Lua
                "rust_analyzer",         -- Rust
                "tailwindcss",           -- Tailwind
                "tsserver",      -- TypeScript, JavaScript, JSX, TSX, Vue (TS)
                "volar",                 -- Vue (vuels and/or volar),
                -- "vuels",
                "emmet_language_server", -- Emmet (HTML)
                "cssls",                 -- CSS
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["tsserver"] = function()
                    require("lspconfig").tsserver.setup({
                        filetypes = {
                            "javascript", 
                            "javascriptreact",
                            "javascript.jsx", 
                            "typescript", 
                            "typescriptreact", 
                            "typescript.tsx", 
                            "vue",
                        },
                        init_options = {
                            plugins = {
                                 {
                                    name = "@vue/typescript-plugin",
                                    location = "C:\\Users\\Sabine\\AppData\\Roaming\\npm\\node_modules\\@vue\\typescript-plugin",
                                    languages = {"javascript", "typescript", "vue"},
                                },
                            },
                        },
                        capabilities = capabilities,
                    })
                end,

                ["volar"] = function ()
                    require("lspconfig").volar.setup({
                        capabilities = capabilities,
                        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                        init_options = {
                            vue = {
                                 hybridMode = false,
                             },
                        },
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            },
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {},
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}