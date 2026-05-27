return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            local colors = _G.pywal_colors or {
                bg = "#1e1e2e", fg = "#cdd6f4", bg2 = "#45475a",
                accent = "#89b4fa", green = "#a6e3a1", yellow = "#f9e2af",
                red = "#f38ba8", cyan = "#94e2d5",
            }

            require("lualine").setup({
                options = {
                    theme = {
                        normal = {
                            a = { bg = colors.accent, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        insert = {
                            a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        visual = {
                            a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        command = {
                            a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        replace = {
                            a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        terminal = {
                            a = { bg = colors.accent, fg = colors.bg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg, fg = colors.fg },
                        },
                        inactive = {
                            a = { bg = colors.bg2, fg = colors.fg, gui = "bold" },
                            b = { bg = colors.bg2, fg = colors.fg },
                            c = { bg = colors.bg2, fg = colors.fg },
                        },
                    },
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = { "nvim-tree", "fugitive" },
            })
        end,
    },
}
