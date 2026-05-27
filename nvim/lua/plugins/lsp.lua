return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls", "pyright", "rust_analyzer",
                "ts_ls", "html", "cssls",
                "jsonls", "yamlls",
                "bashls", "dockerls", "marksman",
                "sqlls", "tailwindcss", "eslint",
                "graphql", "emmet_ls", "prismals",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "SmiteshP/nvim-navic" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local navic = require("nvim-navic")

            local servers = {
                "lua_ls", "pyright", "rust_analyzer",
                "ts_ls", "html", "cssls",
                "jsonls", "yamlls",
                "bashls", "dockerls", "marksman",
                "sqlls", "tailwindcss", "eslint",
                "graphql", "emmet_ls", "prismals",
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        if client.server_capabilities.documentSymbolProvider then
                            navic.attach(client, bufnr)
                        end
                    end,
                })
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
                    end
                    map("n", "gd", vim.lsp.buf.definition, "Goto definition")
                    map("n", "K", vim.lsp.buf.hover, "Hover")
                    map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
                    map("n", "gr", vim.lsp.buf.references, "References")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
                    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
                    map("n", "<leader>D", vim.diagnostic.open_float, "Diagnostic float")
                end,
            })
        end,
    },
}
