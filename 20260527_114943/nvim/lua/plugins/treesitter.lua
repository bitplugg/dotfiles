return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        pcall(function()
            local ts = require("nvim-treesitter.configs")
            ts.setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query",
                    "python", "rust", "c", "cpp",
                    "javascript", "typescript",
                    "html", "css", "json", "yaml",
                    "toml", "bash", "fish",
                    "markdown", "markdown_inline",
                    "gitignore", "diff",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end)
    end,
}
