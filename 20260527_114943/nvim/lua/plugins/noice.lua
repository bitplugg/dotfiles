return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local colors_file = vim.fn.expand("~/.cache/wal/colors.json")
            local ok, colors = pcall(vim.fn.json_decode, vim.fn.readfile(colors_file))
            local accent = "#89b4fa"
            local bg = "#1e1e2e"
            local fg = "#cdd6f4"
            local border = "#45475a"
            if ok and colors then
                accent = colors.colors.color4 or accent
                bg = colors.special.background or bg
                fg = colors.special.foreground or fg
                border = colors.colors.color0 or border
            end

            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                    opts = {
                        position = { row = "50%", col = "50%" },
                        size = { width = 60, height = "auto" },
                        relative = "editor",
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                        },
                    },
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" },
                        search_down = { pattern = "^/", icon = " ", lang = "regex" },
                        search_up = { pattern = "^%?", icon = " ", lang = "regex" },
                        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    },
                },
                messages = {
                    enabled = true,
                    view = "mini",
                },
                popupmenu = {
                    enabled = true,
                    backend = "nui",
                },
                notify = {
                    enabled = true,
                    view = "mini",
                },
                lsp = {
                    progress = { enabled = true },
                    override = {
                        hover = { visible = false },
                        signature = { visible = false },
                    },
                },
                presets = {
                    bottom_search = false,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                    lsp_doc_border = true,
                },
                throttle = 1000,
                views = {
                    cmdline_popup = {
                        position = { row = "50%", col = "50%" },
                        size = { width = 60, height = "auto" },
                        relative = "editor",
                        border = {
                            style = "rounded",
                            padding = { 1, 2 },
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = { row = "50%", col = "50%" },
                        size = { width = 60, height = 10 },
                        border = {
                            style = "rounded",
                            padding = { 1, 2 },
                        },
                    },
                },
            })

            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = accent, bg = bg })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = accent, bg = bg })
            vim.api.nvim_set_hl(0, "NoicePopupmenu", { fg = fg, bg = bg })
            vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = accent, bg = bg })
            vim.api.nvim_set_hl(0, "NoicePopupmenuSelected", { fg = bg, bg = accent })
        end,
    },
}
