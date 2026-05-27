return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = { "Trouble", "TroubleToggle", "Trouble diagnostics" },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "NeoTree toggle" },
            { "<leader>E", "<cmd>Neotree focus<CR>", desc = "NeoTree focus" },
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                enable_git_status = true,
                enable_diagnostics = true,
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                    follow_current_file = { enabled = true },
                },
                default_component_configs = {
                    indent = { with_markers = true },
                    icon = { folder_closed = "", folder_open = "", folder_empty = "" },
                    modified = { symbol = "" },
                    git_status = { symbols = { added = "", modified = "", deleted = "", renamed = "調" } },
                },
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            { "<leader>cf", "<cmd>Conform format<CR>", desc = "Format" },
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "ruff_format" },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    yaml = { { "prettierd", "prettier" } },
                    markdown = { { "prettierd", "prettier" } },
                    rust = { "rustfmt" },
                    sh = { "shfmt" },
                    bash = { "shfmt" },
                    ["*"] = { "trim_whitespace" },
                    ["_"] = { "trim_whitespace" },
                },
                format_on_save = {
                    lsp_format = "fallback",
                    timeout_ms = 500,
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },
                javascript = { "eslint" },
                typescript = { "eslint" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            require("auto-session").setup({
                log_level = "warn",
                auto_session_suppress_dirs = { "/tmp", "~" },
            })
        end,
    },
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        config = function()
            require("mini.hipatterns").setup({
                highlighters = {
                    hex_color = { pattern = "#[%x%d]+" },
                },
            })
        end,
    },
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "SmiteshP/nvim-navic",
        },
        event = "VeryLazy",
        config = function()
            require("barbecue").setup({
                show_dirname = true,
                show_basename = true,
                show_lsp = true,
                show_modifiable = true,
                show_modified = true,
                show_navic = true,
            })
        end,
    },
}
