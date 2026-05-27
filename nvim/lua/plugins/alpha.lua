return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-web-devicons" },
        event = "VimEnter",
        config = function()
            if vim.fn.argc() > 0 then
                return
            end
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            local colors_file = vim.fn.expand("~/.cache/wal/colors.json")
            local ok, colors = pcall(vim.fn.json_decode, vim.fn.readfile(colors_file))

            local fg = "#cdd6f4"
            local accent = "#89b4fa"
            local muted = "#585b70"
            if ok and colors then
                fg = colors.special.foreground or fg
                accent = colors.colors.color4 or accent
                muted = colors.colors.color8 or muted
            end

            local logo = {
                "    ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
                "    ████╗  ██║██║   ██║██║████╗ ████║ ",
                "    ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
                "    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            }

            dashboard.section.header.val = logo
            dashboard.section.header.opts.hl = "Constant"

            dashboard.section.buttons.val = {
                dashboard.button("<leader>ff", "    Find files", "<cmd>Telescope find_files<CR>"),
                dashboard.button("<leader>fg", "    Live grep", "<cmd>Telescope live_grep<CR>"),
                dashboard.button("<leader>o", "  󰉋  File manager", "<cmd>Oil<CR>"),
                dashboard.button("<leader>e", "    Recent files", "<cmd>Telescope oldfiles<CR>"),
                dashboard.button("q", "  󰅚  Quit", "<cmd>qa<CR>"),
            }

            dashboard.section.footer.val = {
                "",
                "    neovim  v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
            }
            dashboard.section.footer.opts.hl = "Comment"

            local function set_highlights()
                vim.api.nvim_set_hl(0, "DashboardHeader", { fg = accent, bold = true })
                vim.api.nvim_set_hl(0, "DashboardButton", { fg = fg })
                vim.api.nvim_set_hl(0, "DashboardCenter", { fg = muted })
                vim.api.nvim_set_hl(0, "DashboardFooter", { fg = muted })
                vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = accent })
            end
            set_highlights()

            dashboard.section.buttons.opts.hl = "DashboardButton"
            dashboard.opts.layout = {
                { type = "padding", val = 2 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }
            dashboard.opts.opts.noautocmd = true

            alpha.setup(dashboard.opts)
        end,
    },
}
