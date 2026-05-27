vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
        pcall(function()
            require("core.pywal_theme")
        end)
    end,
})
