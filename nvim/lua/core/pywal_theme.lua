local colors_file = vim.fn.expand("~/.cache/wal/colors.json")
local colors_ok, colors_file_content = pcall(vim.fn.readfile, colors_file)
local ok, colors = false, nil
if colors_ok then
    ok, colors = pcall(vim.fn.json_decode, colors_file_content)
end

if not ok or not colors then
    vim.cmd("colorscheme habamax")
    return
end

local c = {
    bg = colors.special.background or "#1e1e2e",
    fg = colors.special.foreground or "#cdd6f4",
    cursor = colors.special.cursor or "#f5e0dc",
    color0 = colors.colors.color0 or "#45475a",
    color1 = colors.colors.color1 or "#f38ba8",
    color2 = colors.colors.color2 or "#a6e3a1",
    color3 = colors.colors.color3 or "#f9e2af",
    color4 = colors.colors.color4 or "#89b4fa",
    color5 = colors.colors.color5 or "#f5c2e7",
    color6 = colors.colors.color6 or "#94e2d5",
    color7 = colors.colors.color7 or "#bac2de",
    color8 = colors.colors.color8 or "#585b70",
    color9 = colors.colors.color9 or "#f38ba8",
    color10 = colors.colors.color10 or "#a6e3a1",
    color11 = colors.colors.color11 or "#f9e2af",
    color12 = colors.colors.color12 or "#89b4fa",
    color13 = colors.colors.color13 or "#f5c2e7",
    color14 = colors.colors.color14 or "#94e2d5",
    color15 = colors.colors.color15 or "#f5f5f5",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
hl(0, "FloatBorder", { fg = c.color4, bg = c.bg })
hl(0, "CursorLine", { bg = c.color0 })
hl(0, "CursorLineNr", { fg = c.color3 })
hl(0, "LineNr", { fg = c.color8 })
hl(0, "Visual", { bg = c.color0 })
hl(0, "Search", { fg = c.bg, bg = c.color3 })
hl(0, "IncSearch", { fg = c.bg, bg = c.color5 })
hl(0, "Comment", { fg = c.color8, italic = true })
hl(0, "Constant", { fg = c.color5 })
hl(0, "String", { fg = c.color2 })
hl(0, "Character", { fg = c.color2 })
hl(0, "Number", { fg = c.color9 })
hl(0, "Boolean", { fg = c.color9 })
hl(0, "Identifier", { fg = c.color4 })
hl(0, "Function", { fg = c.color4 })
hl(0, "Statement", { fg = c.color1 })
hl(0, "Conditional", { fg = c.color1 })
hl(0, "Repeat", { fg = c.color1 })
hl(0, "Label", { fg = c.color1 })
hl(0, "Operator", { fg = c.color13 })
hl(0, "Keyword", { fg = c.color1 })
hl(0, "Exception", { fg = c.color1 })
hl(0, "PreProc", { fg = c.color5 })
hl(0, "Include", { fg = c.color5 })
hl(0, "Define", { fg = c.color5 })
hl(0, "Type", { fg = c.color3 })
hl(0, "StorageClass", { fg = c.color3 })
hl(0, "Structure", { fg = c.color3 })
hl(0, "Typedef", { fg = c.color3 })
hl(0, "Special", { fg = c.color6 })
hl(0, "SpecialChar", { fg = c.color6 })
hl(0, "Tag", { fg = c.color5 })
hl(0, "Delimiter", { fg = c.color7 })
hl(0, "SpecialComment", { fg = c.color8 })
hl(0, "Title", { fg = c.color4, bold = true })
hl(0, "Todo", { fg = c.bg, bg = c.color3 })
hl(0, "Error", { fg = c.color1, bg = c.bg })
hl(0, "Underlined", { underline = true })
hl(0, "Pmenu", { fg = c.fg, bg = c.color0 })
hl(0, "PmenuSel", { fg = c.bg, bg = c.color4 })
hl(0, "PmenuSbar", { bg = c.color8 })
hl(0, "PmenuThumb", { bg = c.color7 })
hl(0, "TabLine", { fg = c.fg, bg = c.color0 })
hl(0, "TabLineSel", { fg = c.bg, bg = c.color4 })
hl(0, "TabLineFill", { bg = c.color0 })
hl(0, "StatusLine", { fg = c.fg, bg = c.color0 })
hl(0, "StatusLineNC", { fg = c.color8, bg = c.color0 })
hl(0, "WildMenu", { fg = c.bg, bg = c.color4 })
hl(0, "Directory", { fg = c.color4 })
hl(0, "DiffAdd", { bg = c.color2 })
hl(0, "DiffChange", { bg = c.color3 })
hl(0, "DiffDelete", { bg = c.color1 })
hl(0, "DiffText", { bg = c.color4 })
hl(0, "SpellBad", { undercurl = true, sp = c.color1 })
hl(0, "SpellCap", { undercurl = true, sp = c.color3 })
hl(0, "SpellRare", { undercurl = true, sp = c.color5 })
hl(0, "SpellLocal", { undercurl = true, sp = c.color6 })
hl(0, "MatchParen", { fg = c.color3, bold = true })
hl(0, "NonText", { fg = c.color8 })
hl(0, "SpecialKey", { fg = c.color8 })
hl(0, "Whitespace", { fg = c.color8 })
hl(0, "EndOfBuffer", { fg = c.bg })
hl(0, "Cursor", { fg = c.bg, bg = c.cursor })
hl(0, "ColorColumn", { bg = c.color0 })
hl(0, "Conceal", { fg = c.color8 })
hl(0, "ErrorMsg", { fg = c.color1 })
hl(0, "WarningMsg", { fg = c.color3 })
hl(0, "MoreMsg", { fg = c.color2 })
hl(0, "Question", { fg = c.color4 })
hl(0, "VertSplit", { fg = c.color8 })
hl(0, "Folded", { fg = c.color8, bg = c.color0 })
hl(0, "FoldColumn", { fg = c.color8 })
hl(0, "SignColumn", { bg = c.bg })
hl(0, "ModeMsg", { fg = c.color4 })
hl(0, "MsgArea", { fg = c.fg })
hl(0, "Substitute", { fg = c.bg, bg = c.color1 })

-- LSP
hl(0, "DiagnosticError", { fg = c.color1 })
hl(0, "DiagnosticWarn", { fg = c.color3 })
hl(0, "DiagnosticInfo", { fg = c.color4 })
hl(0, "DiagnosticHint", { fg = c.color6 })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.color1 })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.color3 })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.color4 })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.color6 })

-- Git
hl(0, "gitSignsAdd", { fg = c.color2 })
hl(0, "gitSignsChange", { fg = c.color3 })
hl(0, "gitSignsDelete", { fg = c.color1 })

-- Telescope
hl(0, "TelescopeNormal", { fg = c.fg, bg = c.bg })
hl(0, "TelescopeBorder", { fg = c.color4, bg = c.bg })
hl(0, "TelescopePromptBorder", { fg = c.color4, bg = c.bg })
hl(0, "TelescopePromptNormal", { fg = c.fg, bg = c.color0 })
hl(0, "TelescopePromptPrefix", { fg = c.color1 })
hl(0, "TelescopeSelection", { fg = c.fg, bg = c.color0 })
hl(0, "TelescopeMatching", { fg = c.color3 })

-- Neo-tree
hl(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg })
hl(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
hl(0, "NeoTreeIndentMarker", { fg = c.color8 })
hl(0, "NeoTreeRootName", { fg = c.color4, bold = true })
hl(0, "NeoTreeDirectoryName", { fg = c.color4 })
hl(0, "NeoTreeFileName", { fg = c.fg })
hl(0, "NeoTreeFileNameOpened", { fg = c.color4 })
hl(0, "NeoTreeGitAdded", { fg = c.color2 })
hl(0, "NeoTreeGitModified", { fg = c.color3 })
hl(0, "NeoTreeGitDeleted", { fg = c.color1 })
hl(0, "NeoTreeGitUntracked", { fg = c.color6 })
hl(0, "NeoTreeSymbolicLinkTarget", { fg = c.color5 })
hl(0, "NeoTreeDotfile", { fg = c.color8 })
hl(0, "NeoTreeFloatBorder", { fg = c.color4, bg = c.bg })
hl(0, "NeoTreeTitleBar", { fg = c.bg, bg = c.color4 })
hl(0, "NeoTreeTabActive", { fg = c.fg, bg = c.color0 })
hl(0, "NeoTreeTabInactive", { fg = c.color8, bg = c.bg })
hl(0, "NeoTreeTabSeparatorActive", { fg = c.bg, bg = c.color0 })
hl(0, "NeoTreeTabSeparatorInactive", { fg = c.color8, bg = c.bg })
hl(0, "NeoTreeCursorLine", { bg = c.color0 })

-- Trouble
hl(0, "TroubleNormal", { fg = c.fg, bg = c.bg })
hl(0, "TroubleNormalNC", { fg = c.fg, bg = c.bg })
hl(0, "TroubleText", { fg = c.fg })
hl(0, "TroubleCount", { fg = c.color5, bold = true })
hl(0, "TroubleSource", { fg = c.color4 })
hl(0, "TroubleCode", { fg = c.color3 })
hl(0, "TroubleLocation", { fg = c.color8 })
hl(0, "TroubleFile", { fg = c.color4 })
hl(0, "TroubleFolder", { fg = c.color8 })
hl(0, "TroublePreview", { fg = c.color2 })
hl(0, "TroubleIndent", { fg = c.color8 })
hl(0, "TroubleError", { fg = c.color1 })
hl(0, "TroubleWarning", { fg = c.color3 })
hl(0, "TroubleInfo", { fg = c.color4 })
hl(0, "TroubleHint", { fg = c.color6 })

-- Barbecue / Navic
hl(0, "NavicText", { fg = c.fg })
hl(0, "NavicSeparator", { fg = c.color8 })

return {
    bg = c.bg,
    fg = c.fg,
    bg2 = c.color0,
    accent = c.color4,
    green = c.color2,
    yellow = c.color3,
    red = c.color1,
    cyan = c.color6,
}
