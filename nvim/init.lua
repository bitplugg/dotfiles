vim.g.mapleader = " "

require("core.options")
require("core.keymaps")
require("core.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = { lazy = true, version = false },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = false },
    change_detection = { notify = false },
})

local colors = require("core.pywal_theme")
_G.pywal_colors = colors
