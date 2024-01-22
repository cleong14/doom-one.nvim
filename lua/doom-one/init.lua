-- Neovim Color File
-- Name:            doom-one
-- Maintainer:      https://github.com/NTBBloodbath
-- License:         The MIT License (MIT)
-- Based On:        https://github.com/romgrk/doom-one.vim and the original Doom Emacs one

-- Helpers {{{

local doom_one = {}

local if_nil = vim.F.if_nil
local utils = require("doom-one.utils")
local colors = require("doom-one.colors")

local config = {
  ui = {
    cursor_coloring = if_nil(vim.g.doom_one_cursor_coloring, false),
    terminal_colors = if_nil(vim.g.doom_one_terminal_colors, true),
    italic_comments = if_nil(vim.g.doom_one_italic_comments, false),
    enable_treesitter = if_nil(vim.g.doom_one_enable_treesitter, true),
    diagnostics_text_color = if_nil(vim.g.doom_one_diagnostics_text_color, false),
    transparent_background = if_nil(vim.g.doom_one_transparent_background, false),
    pumblend = {
      enable = if_nil(vim.g.doom_one_pumblend_enable, false),
      transparency_amount = if_nil(vim.g.doom_one_pumblend_transparency, 20),
    },
  },
  plugins = {
    neorg = if_nil(vim.g.doom_one_plugin_neorg, true),
    barbar = if_nil(vim.g.doom_one_plugin_barbar, false),
    telescope = if_nil(vim.g.doom_one_plugin_telescope, false),
    neogit = if_nil(vim.g.doom_one_plugin_neogit, true),
    nvim_tree = if_nil(vim.g.doom_one_plugin_nvim_tree, true),
    dashboard = if_nil(vim.g.doom_one_plugin_dashboard, true),
    startify = if_nil(vim.g.doom_one_plugin_startify, true),
    whichkey = if_nil(vim.g.doom_one_plugin_whichkey, true),
    indent_blankline = if_nil(vim.g.doom_one_plugin_indent_blankline, true),
    vim_illuminate = if_nil(vim.g.doom_one_plugin_vim_illuminate, true),
    lspsaga = if_nil(vim.g.doom_one_plugin_lspsaga, false),
    bufferline = if_nil(vim.g.doom_one_plugin_bufferline, false),
    mason = if_nil(vim.g.doom_one_plugin_mason, false),
    search_nvim = if_nil(vim.g.doom_one_plugin_search_nvim, false),
    neotree = if_nil(vim.g.doom_one_plugin_neotree, false),
    go_nvim = if_nil(vim.g.doom_one_plugin_go_nvim, false),
    noice = if_nil(vim.g.doom_one_plugin_noice, false),
    highlight_undo = if_nil(vim.g.doom_one_plugin_highlight_undo, false),
    vim_visual_multi = if_nil(vim.g.doom_one_plugin_vim_visual_multi, false),
    gitsigns = if_nil(vim.g.doom_one_plugin_gitsigns, false),
  },
}

local function set_hl(group, values)
  vim.api.nvim_set_hl(0, group, values)
end

-- }}}

-- TODO: Re-add plugins integration here
doom_one.set_colorscheme = function()
  -- Set UI options
  ------------------
  if config.ui.cursor_coloring then
    vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor25-Cursor"
  end

  if config.ui.pumblend.enable then
    vim.opt.pumblend = config.ui.pumblend.transparency_amount
  end

  -- Set colorscheme
  ------------------
  local current_bg = vim.opt.background:get()
  local palette = colors.get_palette(current_bg)

  local dark_theme = current_bg == "dark"

  local diff_change_fg = palette.blue
  local diff_change_bg = utils.darken(utils.mix("#D8EEFD", palette.bg, 0.8), 0.2)

  local diff_add_fg = palette.green
  local diff_add_bg = utils.darken(utils.mix("#acf2bd", palette.bg, 0.8), 0.2)

  local diff_delete_fg = palette.red
  local diff_delete_bg = utils.darken(utils.mix("#ffdce0", palette.bg, 0.8), 0.2)

  --- GENERAL UI
  -----------------
  -- local bg_highlight = "#1D2125"
  -- local fg_highlight = utils.lighten(palette.fg, 0.2)

  set_hl("Normal", { bg = config.ui.transparent_background and "NONE" or palette.bg, fg = palette.fg })
  set_hl("NormalPopup", { bg = palette.bg_alt, fg = utils.lighten(palette.fg, 0.2) })
  set_hl("NormalPopover", { bg = palette.bg_alt, fg = utils.lighten(palette.fg, 0.2) })
  set_hl("NormalPopupPrompt", { bg = palette.bg_alt, fg = palette.base7, bold = true })
  set_hl("NormalPopupSubtle", { bg = palette.bg_alt, fg = palette.base6 })
  set_hl("EndOfBuffer", { bg = "bg", fg = "bg" })

  set_hl("NormalFloatNoBg", { bg = palette.bg })
  set_hl("NormalFloatNoBgBorder", { bg = palette.bg, fg = dark_theme and palette.fg_alt or palette.base4 })
  -- set_hl("NormalFloatNoBgBorder", { bg = palette.bg, fg = dark_theme and utils.lighten(palette.base5, 0.1) or palette.base4 })

  -- set_hl("NormalFloat", { bg = palette.bg_alt })
  set_hl("NormalFloat", { bg = "bg" })
  -- set_hl("NormalFloatBorder", { fg = dark_theme and palette.fg_alt or palette.base4 })
  set_hl("NormalFloatBorder", { bg = "bg", fg = dark_theme and palette.fg_alt or palette.base4 })
  set_hl("NormalFloatBgAltBorder", { bg = palette.bg_alt, fg = dark_theme and palette.fg_alt or palette.base4 })
  -- set_hl("NormalFloatBorder", { bg = palette.bg_alt, fg = dark_theme and utils.lighten(palette.base5, 0.1) or palette.base4 })

  set_hl("FloatBorderNoBg", { link = "NormalFloatNoBgBorder" })
  set_hl("FloatBorder", { link = "NormalFloatBorder" })

  set_hl("Visual", { bg = palette.dark_blue })
  set_hl("VisualBold", { bg = palette.dark_blue, bold = true })

  set_hl("LineNr", { bg = "bg", fg = palette.grey })
  set_hl("Cursor", { bg = palette.blue, fg = palette.bg_alt })
  set_hl("CursorLine", { bg = palette.bg_alt })
  set_hl("CursorLineNr", { bg = palette.bg_alt, fg = "fg" })
  set_hl("CursorColumn", { bg = palette.bg_alt })

  set_hl("Folded", { bg = palette.bg_alt, fg = palette.base5 })
  set_hl("FoldColumn", { bg = "bg", fg = palette.fg_alt })
  set_hl("SignColumn", { bg = "bg" })
  set_hl("ColorColumn", { bg = palette.bg_alt })

  set_hl("IndentGuide", { fg = palette.grey })
  set_hl("IndentGuideEven", { link = "IndentGuide" })
  set_hl("IndentGuideOdd", { link = "IndentGuide" })

  set_hl("TermCursor", { bg = palette.blue, fg = palette.bg_alt })
  set_hl("TermCursorNC", { fg = palette.fg_alt, reverse = true })
  set_hl("TermNormal", { link = "Normal" })
  set_hl("TermNormalNC", { link = "TermNormal" })

  set_hl("WildMenu", { bg = palette.dark_blue, fg = "fg" })
  set_hl("Separator", { fg = palette.fg_alt })
  -- set_hl("SeparatorSubtle", { bg = palette.bg_alt, fg = palette.fg_alt })
  set_hl("SeparatorSubtle", { bg = palette.bg, fg = palette.fg_alt })
  set_hl("VertSplit", { bg = "bg", fg = palette.grey })
  set_hl("VertSplitSubtle", { bg = palette.bg_alt, fg = palette.grey })

  set_hl("WinSeparator", { bg = config.ui.transparent_background and "NONE" or palette.bg, fg = palette.fg_alt })
  set_hl("WinSeparatorSubtle", { bg = config.ui.transparent_background and "NONE" or palette.bg_alt, fg = palette.fg_alt })

  -- `NC` - not current focus
  set_hl("WinBar", { bg = "bg" })
  set_hl("WinBarNC", { bg = "bg" })

  set_hl("TabLine", { bg = palette.bg_alt, fg = palette.base7, bold = true })
  set_hl("TabLineSel", { bg = "bg", fg = palette.blue, bold = true })
  set_hl("TabLineFill", { bg = palette.base1, bold = true })

  -- set_hl("StatusLine", { bg = dark_theme and palette.base3 or palette.base2, fg = palette.base8 })
  set_hl("StatusLine", { bg = "bg", fg = palette.base8 })
  set_hl("StatusLineNC", { bg = palette.bg_alt, fg = palette.base6 })
  set_hl("StatusLinePart", { bg = palette.bg_alt, fg = palette.base6, bold = true })
  set_hl("StatusLinePartNC", { link = "StatusLinePart" })

  -- set_hl("Pmenu", { bg = palette.bg_alt, fg = "fg" })
  set_hl("Pmenu", { bg = palette.bg, fg = "fg" })
  set_hl("PmenuSel", { bg = palette.blue, fg = dark_theme and palette.base0 or palette.base8, bold = true })
  set_hl("PmenuSelBold", { bg = palette.blue, fg = dark_theme and palette.base0 or palette.base8, bold = true })
  -- set_hl("PmenuSbar", { bg = palette.bg_alt })
  set_hl("PmenuSbar", { bg = palette.bg })
  set_hl("PmenuThumb", { bg = palette.grey })

  --- Search, Highlight, Conceal, Messages
  ----------------------------------------
  set_hl("Search", { bg = palette.dark_blue, fg = "fg" })
  set_hl("Substitute", { fg = palette.red, bold = true, strikethrough = true })
  set_hl("IncSearch", { bg = palette.dark_blue, fg = "fg", bold = true })
  set_hl("IncSearchCursor", { reverse = true, bold = true })

  set_hl("CurSearch", { link = "IncSearch" })

  set_hl("Conceal", { fg = palette.grey })
  set_hl("SpecialKey", { fg = palette.violet, bold = true })
  set_hl("NonText", { fg = palette.fg_alt, bold = true })
  set_hl("MatchParen", { fg = palette.red, bold = true })
  set_hl("Whitespace", { fg = palette.grey })

  set_hl("Highlight", { bg = palette.bg_alt })
  set_hl("HighlightSubtle", { link = "Highlight" })

  set_hl("Question", { fg = palette.green, bold = true })

  set_hl("File", { fg = "fg" })
  set_hl("Directory", { fg = palette.violet, bold = true })
  set_hl("Title", { fg = palette.violet, bold = true })

  set_hl("Bold", { bold = true })
  set_hl("Emphasis", { italic = true })

  --- Text Levels
  ---------------
  local text_colors = {
    Normal = palette.fg,
    Info = palette.blue,
    Hint = palette.green,
    Success = palette.green,
    Warning = palette.yellow,
    Debug = palette.yellow,
    Error = palette.red,
    Special = palette.violet,
    Muted = dark_theme and palette.base7 or palette.base5,
  }

  for group, hl in pairs(text_colors) do
    -- set_hl("Text" .. group, { fg = hl })
    -- set_hl("Text" .. group .. "Bold", { fg = hl, bold = true })
    set_hl("Text" .. group, { bg = "NONE", fg = hl })
    set_hl("Text" .. group .. "Bold", { bg = "NONE", fg = hl, bold = true })
  end

  set_hl("Msg", { link = "TextSuccess" })
  set_hl("MsgBold", { link = "TextSuccessBold" })
  set_hl("MoreMsg", { link = "TextInfo" })
  set_hl("MoreMsgBold", { link = "TextInfoBold" })
  set_hl("WarningMsg", { link = "TextWarning" })
  set_hl("WarningMsgBold", { link = "TextWarningBold" })
  set_hl("Error", { link = "TextError" })
  set_hl("ErrorMsg", { link = "TextError" })
  set_hl("ErrorMsgBold", { link = "TextErrorBold" })
  set_hl("ModeMsg", { link = "TextSpecial" })
  set_hl("Todo", { link = "TextWarningBold" })

  --- Checkhealth
  ---------------
  set_hl("healthError", { link = "ErrorMsg" })
  set_hl("healthSuccess", { link = "Msg" })
  set_hl("healthWarning", { link = "WarningMsg" })

  --- Main Syntax
  ---------------
  set_hl("Tag", { fg = utils.mix(palette.blue, palette.cyan, 0.5), bold = true })
  set_hl("Link", { fg = palette.green, underline = true })
  set_hl("URL", { link = "Link" })
  set_hl("Underlined", { fg = utils.mix(palette.blue, palette.cyan, 0.5), underline = true })

  set_hl("Comment", { fg = dark_theme and utils.lighten(palette.base5, 0.1) or palette.base4, italic = config.ui.italic_comments })
  set_hl("CommentBold", { fg = dark_theme and utils.lighten(palette.base5, 0.1) or palette.base4, bold = true })
  set_hl("SpecialComment", { fg = dark_theme and palette.base7 or palette.base5, bold = true })

  set_hl("Macro", { fg = palette.violet })
  set_hl("Define", { fg = palette.violet, bold = true })
  set_hl("Include", { fg = palette.violet, bold = true })
  set_hl("PreProc", { fg = palette.violet, bold = true })
  set_hl("PreCondit", { fg = palette.violet, bold = true })

  set_hl("Label", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Repeat", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Keyword", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Operator", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Delimiter", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Statement", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Exception", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Conditional", { fg = dark_theme and palette.blue or palette.red })

  -- set_hl("Variable", { fg = utils.darken(palette.magenta, 0.36) })
  -- set_hl("VariableBuiltin", { fg = palette.magenta, bold = true })
  set_hl("Variable", { fg = "#8B93E6" })
  set_hl("VariableBuiltin", { fg = "#8B93E6", bold = true })
  set_hl("Constant", { fg = palette.violet, bold = true })

  set_hl("Number", { fg = palette.orange })
  set_hl("Float", { link = "Number" })
  set_hl("Boolean", { fg = palette.orange, bold = true })
  set_hl("Enum", { fg = palette.orange })

  set_hl("Character", { fg = palette.violet, bold = true })
  set_hl(
    "SpecialChar",
    { fg = dark_theme and utils.darken(palette.violet, 0.15) or utils.lighten(palette.violet, 0.26), bold = true }
  )
  set_hl("String", { fg = palette.green })
  set_hl("StringDelimiter", { link = "String" })

  set_hl("Special", { fg = palette.violet })
  set_hl("SpecialBold", { fg = palette.violet, bold = true })

  set_hl("Field", { fg = palette.violet })
  set_hl(
    "Argument",
    { fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
  )
  set_hl(
    "Attribute",
    { fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
  )
  set_hl(
    "Identifier",
    { fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
  )
  set_hl("Property", { fg = palette.magenta })
  set_hl("Function", { fg = palette.magenta })
  set_hl("FunctionBuiltin", {
    fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.2),
    bold = true,
  })
  set_hl("KeywordFunction", { fg = dark_theme and palette.blue or palette.red, bold = true })
  set_hl("Method", { fg = dark_theme and palette.violet or palette.cyan })

  set_hl("Type", { fg = palette.yellow })
  set_hl("Typedef", { fg = dark_theme and palette.blue or palette.red })
  set_hl("TypeBuiltin", { fg = palette.yellow, bold = true })
  set_hl("Class", { fg = dark_theme and palette.blue or palette.red })
  set_hl("StorageClass", { fg = dark_theme and palette.blue or palette.red })
  set_hl("Structure", { fg = dark_theme and palette.blue or palette.red })

  set_hl("Regexp", { fg = "#dd0093" })
  set_hl("RegexpSpecial", { fg = "#a40073" })
  set_hl("RegexpDelimiter", { fg = "#540063", bold = true })
  set_hl("RegexpKey", { fg = "#5f0041", bold = true })

  set_hl("CommentURL", { link = "URL" })
  set_hl("CommentLabel", { link = "CommentBold" })
  set_hl("CommentSection", { link = "CommentBold" })
  set_hl("Noise", { link = "Comment" })

  set_hl("QuickFixLine", { link = "Search" })

  --- Diff
  --------
  set_hl("diffLine", { fg = palette.base8, bg = diff_change_bg })
  set_hl("diffSubName", { fg = palette.base8, bg = diff_change_bg })

  set_hl("DiffAdd", { bg = palette.grey })
  set_hl("DiffChange", { bg = palette.grey })
  set_hl("DiffText", { bg = palette.grey })
  set_hl("DiffDelete", { bg = palette.grey })

  set_hl("DiffAdded", { fg = diff_add_fg, bg = diff_add_bg })
  set_hl("DiffModified", { fg = diff_change_fg, bg = diff_change_bg })
  set_hl("DiffRemoved", { fg = diff_delete_fg, bg = diff_delete_bg })

  set_hl("DiffAddedGutter", { fg = diff_add_fg, bold = true })
  set_hl("DiffModifiedGutter", { fg = diff_change_fg, bold = true })
  set_hl("DiffRemovedGutter", { fg = diff_delete_fg, bold = true })

  set_hl("DiffAddedGutterLineNr", { fg = palette.grey })
  set_hl("DiffModifiedGutterLineNr", { fg = palette.grey })
  set_hl("DiffRemovedGutterLineNr", { fg = palette.grey })


  --- Markdown
  ------------
  -- -- set_hl("markdownCode", { link = "Comment" })
  -- -- set_hl("markdownCodeBlock", { link = "markdownCode" })
  -- set_hl("markdownCode", { bg = bg_highlight })
  -- set_hl("markdownCodeBlock", { bg = bg_highlight })
  -- set_hl("markdownH1", { bold = true })
  -- set_hl("markdownH2", { bold = true })
  -- set_hl("markdownLinkText", { underline = true })

  --- LSP
  ------------
  if config.ui.diagnostics_text_color then
    set_hl("ErrorMsgUnderline", { fg = palette.red, underline = true })
    set_hl("WarningMsgUnderline", { fg = palette.yellow, underline = true })
    set_hl("MoreMsgUnderline", { fg = palette.blue, underline = true })
    set_hl("MsgUnderline", { fg = palette.green, underline = true })
  else
    set_hl("ErrorMsgUnderline", { sp = palette.red, underline = true })
    set_hl("WarningMsgUnderline", { sp = palette.yellow, underline = true })
    set_hl("MoreMsgUnderline", { sp = palette.blue, underline = true })
    set_hl("MsgUnderline", { sp = palette.green, underline = true })
  end

  set_hl("LspHighlight", { bg = palette.bg_alt, bold = true })
  set_hl("LspSignatureActiveParameter", { fg = palette.violet })
  set_hl("DiagnosticFloatingError", { link = "ErrorMsg" })
  set_hl("DiagnosticFloatingWarn", { link = "WarningMsg" })
  set_hl("DiagnosticFloatingInfo", { link = "MoreMsg" })
  set_hl("DiagnosticFloatingHint", { link = "Msg" })
  set_hl("DiagnosticDefaultError", { link = "ErrorMsg" })
  set_hl("DiagnosticDefaultWarn", { link = "WarningMsg" })
  set_hl("DiagnosticDefaultInfo", { link = "MoreMsg" })
  set_hl("DiagnosticDefaultHint", { link = "Msg" })
  set_hl("DiagnosticVirtualTextError", { link = "ErrorMsg" })
  set_hl("DiagnosticVirtualTextWarn", { link = "WarningMsg" })
  set_hl("DiagnosticVirtualTextInfo", { link = "MoreMsg" })
  set_hl("DiagnosticVirtualTextHint", { link = "Msg" })
  set_hl("DiagnosticUnderlineError", { link = "ErrorMsgUnderline" })
  set_hl("DiagnosticUnderlineWarn", { link = "WarningMsgUnderline" })
  set_hl("DiagnosticUnderlineInfo", { link = "MoreMsgUnderline" })
  set_hl("DiagnosticUnderlineHint", { link = "MsgUnderline" })
  set_hl("DiagnosticSignError", { link = "ErrorMsg" })
  set_hl("DiagnosticSignWarn", { link = "WarningMsg" })
  set_hl("DiagnosticSignInfo", { link = "MoreMsg" })
  set_hl("DiagnosticSignHint", { link = "Msg" })
  set_hl("LspReferenceText", { link = "LspHighlight" })
  set_hl("LspReferenceRead", { link = "LspHighlight" })
  set_hl("LspReferenceWrite", { link = "LspHighlight" })

  --- CMP
  ------------
  set_hl("CmpItemAbbrDeprecated", { fg = palette.fg_alt, bg = "NONE", strikethrough = true })
  set_hl("CmpItemAbbrMatch", { fg = palette.blue, bg = "NONE" })
  set_hl("CmpItemAbbrMatchFuzzy", { fg = palette.blue, bg = "NONE" })
  set_hl("CmpItemMenu", { fg = palette.fg, bg = "NONE" })

  --- Tree-Sitter
  ---------------
  if config.ui.enable_treesitter then
    -- These groups are for the Neovim tree-sitter highlights.
    --
    -- NOTE: only configure what you need to; over configuration will begin to mess up colorscheme
    --
    --
    set_hl("@annotation", { link = "PreProc" })
    set_hl("@attribute", { link = "Attribute" })
    set_hl("@boolean", { link = "Boolean" })
    -- set_hl("@character", { link = "Character" })
    -- set_hl("@character.special", { link = "SpecialChar" })
    set_hl("@comment", { link = "Comment" })
    set_hl("@keyword.conditional", { link = "Conditional" })
    set_hl("@constant", { link = "Constant" })
    set_hl("@constant.builtin", { link = "Constant" })
    set_hl("@constant.macro", { link = "Macro" })
    -- set_hl("@keyword.debug", { link = "TextDebug" })
    -- set_hl("@keyword.directive.define", { link = "Define" })
    set_hl("@keyword.exception", { link = "Exception" })
    set_hl("@number.float", { link = "Float" })
    set_hl("@function", { link = "Function" })
    set_hl("@function.builtin", { link = "FunctionBuiltin" })
    -- set_hl("@function.call", { link = "@function" })
    set_hl("@function.macro", { link = "Macro" })
    -- set_hl("@keyword.import", { link = "Include" })
    -- set_hl("@keyword.coroutine", { link = "@keyword" })
    -- set_hl("@keyword.operator", { link = "@operator" })
    -- set_hl("@keyword.return", { link = "@keyword" })
    set_hl("@function.method", { link = "Method" })
    -- set_hl("@function.method.call", { link = "@function.method" })
    -- set_hl("@namespace.builtin", { link = "@variable.builtin" })
    -- set_hl("@none", {})
    set_hl("@number", { link = "Number" })
    -- set_hl("@keyword.directive", { link = "PreProc" })
    set_hl("@keyword.repeat", { link = "Repeat" })
    -- set_hl("@keyword.storage", { link = "StorageClass" })
    set_hl("@string", { link = "String" })
    set_hl("@markup.link.label", { link = "Title" })
    -- set_hl("@markup.link.label.symbol", { link = "Title" })
    set_hl("@tag", { link = "Tag" })
    set_hl("@tag.attribute", { link = "Attribute" })
    set_hl("@tag.delimiter", { link = "Delimiter" })
    -- set_hl("@markup", { link = "@none" })
    -- set_hl("@markup.environment", { link = "Macro" })
    -- set_hl("@markup.environment.name", { link = "Type" })
    -- -- set_hl("@markup.raw", { link = "String" })
    set_hl("@markup.math", { link = "Special" })
    set_hl("@markup.strong", { bold = true })
    set_hl("@markup.emphasis", { italic = true })
    set_hl("@markup.italic", { italic = true })
    set_hl("@markup.strikethrough", {
      fg = dark_theme and utils.darken(palette.violet, 0.2) or utils.lighten(palette.violet, 0.26),
      strikethrough = true,
    })
    set_hl("@markup.underline", { underline = true })
    set_hl("@markup.heading", { link = "Title" })
    set_hl("@comment.note", { link = "TextHint" })
    set_hl("@comment.error", { link = "TextError" })
    set_hl("@comment.info", { link = "TextInfo" })
    set_hl("@comment.hint", { link = "TextHint" })
    set_hl("@comment.warning", { link = "TextWarning" })
    set_hl("@comment.todo", { link = "Todo" })
    set_hl("@markup.link.url", { link = "URL" })
    set_hl("@type", { link = "Type" })
    set_hl("@type.definition", { link = "Typedef" })
    -- set_hl("@type.qualifier", { link = "@keyword" })
    -- --- Misc
    -- -- set_hl("@comment.documentation", {})
    set_hl("@operator", { link = "Operator" })
    --- Punctuation
    set_hl("@punctuation.delimiter", { link = "Delimiter" })
    set_hl("@punctuation.bracket", { link = "Delimiter" })
    set_hl("@punctuation.special", { link = "Delimiter" })
    set_hl("@markup.list", { link = "Delimiter" })
    -- set_hl("@markup.list.markdown", { link = "Delimiter" })
    -- --- Literals
    -- set_hl("@string.documentation", { link = "String" })
    set_hl("@string.regexp", { link = "StringDelimiter" })
    set_hl("@string.escape", { link = "StringDelimiter" })
    -- --- Functions
    set_hl("@constructor", { link = "Structure" })
    set_hl("@variable.parameter", { link = "Argument" })
    set_hl("@variable.parameter.builtin", { link = "Argument" })
    --- Keywords
    set_hl("@keyword", { link = "Keyword" })
    set_hl("@keyword.function", { link = "KeywordFunction" })
    --
    set_hl("@label", { link = "Label" })
    --
    -- --- Types
    set_hl("@type.builtin", { link = "TypeBuiltin" })
    set_hl("@variable.member", { link = "Field" })
    set_hl("@property", { link = "Property" })
    --
    --- Identifiers
    set_hl("@variable", { link = "Variable" })
    set_hl("@variable.builtin", { link = "VariableBuiltin" })
    -- set_hl("@module.builtin", { link = "VariableBuiltin" })
    --
    --- Text
    -- set_hl("@markup.raw.markdown", { link = "String" })
    set_hl("@markup.raw.markdown_inline", { link = "String" })
    set_hl("@markup.raw.block", { link = "String" })
    set_hl("@markup.raw.delimiter", { link = "Delimiter" })
    set_hl("@markup.link", { link = "Delimiter" })

    set_hl("@markup.list.unchecked", { link = "TypeBuiltin" })
    set_hl("@markup.list.checked", { link = "TypeBuiltin" })

    set_hl("@diff.plus", { link = "DiffAdded" })
    set_hl("@diff.minus", { link = "DiffRemoved" })
    set_hl("@diff.delta", { link = "DiffModified" })
    --
    set_hl("@module", { link = "Include" })
    --

    -- -- tsx
    -- set_hl("@tag.tsx", { link = "@tag" })
    -- set_hl("@constructor.tsx", { link = "@constructor" })
    -- set_hl("@tag.delimiter.tsx", { link = "@tag.delimiter" })

    -- -- LSP Semantic Token Groups
    -- set_hl("@lsp.type.boolean", { link = "@boolean" })
    -- set_hl("@lsp.type.builtinType", { link = "@type.builtin" })
    -- set_hl("@lsp.type.comment", { link = "@comment" })
    -- set_hl("@lsp.type.decorator", { link = "@attribute" })
    -- set_hl("@lsp.type.deriveHelper", { link = "@attribute" })
    -- set_hl("@lsp.type.enum", { link = "@type" })
    -- set_hl("@lsp.type.enumMember", { link = "@constant" })
    -- set_hl("@lsp.type.escapeSequence", { link = "@string.escape" })
    -- set_hl("@lsp.type.formatSpecifier", { link = "@markup.list" })
    -- set_hl("@lsp.type.generic", { link = "@variable" })
    -- set_hl("@lsp.type.interface", { link = "@type.definition" })
    -- set_hl("@lsp.type.keyword", { link = "@keyword" })
    -- set_hl("@lsp.type.lifetime", { link = "@keyword.storage" })
    -- set_hl("@lsp.type.namespace", { link = "@module" })
    -- set_hl("@lsp.type.number", { link = "@number" })
    -- set_hl("@lsp.type.operator", { link = "@operator" })
    -- set_hl("@lsp.type.parameter", { link = "@variable.parameter" })
    -- set_hl("@lsp.type.property", { link = "@property" })
    -- set_hl("@lsp.type.selfKeyword", { link = "@variable.builtin" })
    -- set_hl("@lsp.type.selfTypeKeyword", { link = "@variable.builtin" })
    -- set_hl("@lsp.type.string", { link = "@string" })
    -- set_hl("@lsp.type.typeAlias", { link = "@type.definition" })
    -- set_hl("@lsp.type.unresolvedReference", { link = "ErrorMsgUnderline" })
    -- set_hl("@lsp.type.variable", {})
    -- set_hl("@lsp.typemod.class.defaultLibrary", { link = "@type.builtin" })
    -- set_hl("@lsp.typemod.enum.defaultLibrary", { link = "@type.builtin" })
    -- set_hl("@lsp.typemod.enumMember.defaultLibrary", { link = "@constant.builtin" })
    -- set_hl("@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
    -- set_hl("@lsp.typemod.keyword.async", { link = "@keyword.coroutine" })
    -- set_hl("@lsp.typemod.keyword.injected", { link = "@keyword" })
    -- set_hl("@lsp.typemod.macro.defaultLibrary", { link = "@function.builtin" })
    -- set_hl("@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
    -- set_hl("@lsp.typemod.operator.injected", { link = "@operator" })
    -- set_hl("@lsp.typemod.string.injected", { link = "@string" })
    -- set_hl("@lsp.typemod.struct.defaultLibrary", { link = "@type.builtin" })
    -- set_hl("@lsp.typemod.type.defaultLibrary", { link = "@type.definition" })
    -- set_hl("@lsp.typemod.typeAlias.defaultLibrary", { link = "@type.definition" })
    -- set_hl("@lsp.typemod.variable.callable", { link = "@function" })
    -- set_hl("@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
    -- set_hl("@lsp.typemod.variable.injected", { link = "@variable" })
    -- set_hl("@lsp.typemod.variable.static", { link = "@constant" })
  end

  --- NetRW
  ---------
  set_hl("netrwClassify", { fg = palette.blue })
  set_hl("netrwDir", { link = "Directory" })
  set_hl("netrwExe", { fg = palette.green, bold = true })
  set_hl("netrwMakefile", { fg = palette.yellow, bold = true })
  set_hl("netrwTreeBar", { link = "Comment" })

  --- Terminal colors
  -------------------
  if config.ui.terminal_colors then
    vim.g.terminal_color_0 = palette.bg
    vim.g.terminal_color_1 = palette.red
    vim.g.terminal_color_2 = palette.green
    vim.g.terminal_color_3 = palette.yellow
    vim.g.terminal_color_4 = palette.blue
    vim.g.terminal_color_5 = palette.violet
    vim.g.terminal_color_6 = palette.cyan
    vim.g.terminal_color_7 = palette.fg
    vim.g.terminal_color_8 = palette.grey
    vim.g.terminal_color_9 = palette.red
    vim.g.terminal_color_10 = palette.green
    vim.g.terminal_color_11 = palette.orange
    vim.g.terminal_color_12 = palette.blue
    vim.g.terminal_color_13 = palette.violet
    vim.g.terminal_color_14 = palette.cyan
    vim.g.terminal_color_15 = palette.white
    vim.g.terminal_color_background = palette.bg_alt
    vim.g.terminal_color_foreground = palette.fg_alt
  end

  --- Plugins integrations
  ------------------------
  if config.plugins.indent_blankline then
    set_hl("IblIndent", { fg = palette.base4, nocombine = true })
    set_hl("IblScope", { fg = dark_theme and palette.blue or palette.orange, nocombine = true })
    set_hl("IblWhitespace", { link = "IblIndent" })
  end

  if config.plugins.neorg then
    set_hl("NeorgMarkupVerbatim", { link = "Comment" })

    -- Headers and their prefix icon
    set_hl("NeorgHeading1Title", { link = "@attribute" })
    set_hl("NeorgHeading2Title", { link = "@label" })
    set_hl("NeorgHeading3Title", { link = "@math" })
    set_hl("NeorgHeading4Title", { link = "@string" })
    set_hl("NeorgHeading5Title", { link = "@type" })
    set_hl("NeorgHeading6Title", { link = "@number" })
    set_hl("NeorgHeading1Prefix", { link = "@attribute" })
    set_hl("NeorgHeading2Prefix", { link = "@label" })
    set_hl("NeorgHeading3Prefix", { link = "@math" })
    set_hl("NeorgHeading4Prefix", { link = "@string" })
    set_hl("NeorgHeading5Prefix", { link = "@type" })
    set_hl("NeorgHeading6Prefix", { link = "@number" })

    -- Colors are for nested quotes
    set_hl("Blue", { fg = palette.blue })
    set_hl("Yellow", { fg = palette.yellow })
    set_hl("Red", { fg = palette.red })
    set_hl("Green", { fg = palette.green })
    set_hl("Brown", { fg = palette.orange })

    -- Headlines support
    -- Note: requires custom highlight groups in headlines setup!
    set_hl("Headline1", { bg = utils.blend(utils.get_hl("NeorgHeading1Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline2", { bg = utils.blend(utils.get_hl("NeorgHeading2Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline3", { bg = utils.blend(utils.get_hl("NeorgHeading3Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline4", { bg = utils.blend(utils.get_hl("NeorgHeading4Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline5", { bg = utils.blend(utils.get_hl("NeorgHeading5Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline6", { bg = utils.blend(utils.get_hl("NeorgHeading6Title", "foreground"), palette.bg, 0.18) })
  end

  if config.plugins.vim_illuminate then
    set_hl("illuminatedWord", { underline = true })
  end

  if config.plugins.barbar then
    set_hl("BufferCurrent", { bg = "bg", fg = dark_theme and palette.base8 or palette.base0 })
    set_hl("BufferCurrentIndex", { bg = "bg", fg = palette.base6 })
    set_hl("BufferCurrentMod", { bg = "bg", fg = palette.yellow })
    set_hl("BufferCurrentSign", { bg = "bg", fg = palette.blue })
    set_hl("BufferCurrentTarget", { bg = "bg", fg = palette.red, bold = true })

    set_hl("BufferVisible", { fg = palette.base7, bg = "bg" })
    set_hl("BufferVisibleIndex", { fg = palette.base6, bg = "bg" })
    set_hl("BufferVisibleMod", { fg = palette.yellow, bg = "bg" })
    set_hl("BufferVisibleSign", { fg = palette.base4, bg = "bg" })
    set_hl("BufferVisibleTarget", { fg = palette.red, bg = "bg", bold = true })

    set_hl("BufferInactive", { fg = palette.base6, bg = dark_theme and palette.base1 or palette.base8 })
    set_hl("BufferInactiveIndex", { fg = palette.base6, bg = dark_theme and palette.base1 or palette.base8 })
    set_hl("BufferInactiveMod", { fg = palette.yellow, bg = dark_theme and palette.base1 or palette.base8 })
    set_hl("BufferInactiveSign", { fg = palette.base4, bg = dark_theme and palette.base1 or palette.base8 })
    set_hl(
      "BufferInactiveTarget",
      { fg = palette.red, bg = dark_theme and palette.base1 or palette.base8, bold = true }
    )

    set_hl("BufferTabpages", { fg = palette.blue, bg = palette.bg_alt, bold = true })
    set_hl(
      "BufferTabpageFill",
      { fg = palette.base4, bg = dark_theme and palette.base1 or palette.base8, bold = true }
    )

    set_hl("BufferPart", { fg = palette.fg_alt, bg = palette.bg_alt, bold = true })
  end

  if config.plugins.telescope then
    set_hl("TelescopeNormal", { fg = "fg" })
    set_hl("TelescopePrompt", { fg = palette.blue })
    set_hl("TelescopePromptPrefix", { fg = dark_theme and palette.blue or palette.red })
    set_hl("TelescopeBorder", { fg = dark_theme and palette.blue or palette.red })
    set_hl("TelescopePromptBorder", { link = "TelescopeBorder" })
    set_hl("TelescopeResultsBorder", { link = "TelescopeBorder" })
    set_hl("TelescopePreviewBorder", { link = "TelescopeBorder" })
    set_hl("TelescopeMatching", { fg = palette.blue, bold = true })
    set_hl("TelescopeSelection", { fg = palette.yellow, bold = true })
    set_hl("TelescopeSelectionCaret", { fg = dark_theme and palette.blue or palette.red })
  end

  if config.plugins.neogit then
    set_hl("NeogitDiffAdd", { bg = "#e9f1e8", fg = "#40803f" })
    set_hl("NeogitDiffAddHighlight", { bg = "#d8e8d7", fg = palette.green, bold = true })
    set_hl("NeogitDiffDelete", { bg = "#f7e9e8", fg = "#cc5655" })
    set_hl("NeogitDiffDeleteHighlight", { bg = "#f5d9d6", fg = palette.red, bold = true })
    set_hl("NeogitDiffContext", { bg = "bg", fg = palette.fg_alt })
    set_hl("NeogitDiffContextHighlight", { bg = palette.bg_alt, fg = "fg", bold = true })
    set_hl(
      "NeogitHunkHeader",
      { bg = dark_theme and utils.darken(palette.violet, 0.2) or utils.lighten(palette.violet, 0.16), fg = "bg" }
    )
    set_hl("NeogitHunkHeaderHighlight", { bg = palette.violet, fg = palette.bg_alt, bold = true })
    set_hl("NeogitStagedChanges", { fg = dark_theme and palette.blue or palette.orange, bold = true })
    set_hl("NeogitStagedChangesRegion", { bg = palette.bg_alt })
    set_hl("NeogitStashes", { fg = dark_theme and palette.blue or palette.orange, bold = true })
    set_hl("NeogitUnstagedChanges", { fg = dark_theme and palette.blue or palette.orange, bold = true })
    set_hl("NeogitUntrackedfiles", { fg = dark_theme and palette.blue or palette.orange, bold = true })
  end

  if config.plugins.dashboard then
    set_hl("dashboardHeader", { fg = palette.base5 })
    set_hl("dashboardFooter", { link = "dashboardHeader" })
    set_hl("dashboardCenter", { fg = dark_theme and palette.blue or palette.orange })
    set_hl("dashboardShortcut", { fg = palette.violet })
    set_hl("DashboardIcon", { fg = dark_theme and palette.blue or palette.orange })
    -- set_hl("DashboardKey", { fg = palette.violet })
  end

  if config.plugins.startify then
    set_hl("StartifyHeader", { fg = palette.fg_alt })
    set_hl("StartifyBracket", { fg = palette.grey })
    set_hl("StartifyNumber", { fg = dark_theme and palette.blue or palette.orange })
    set_hl("StartifyPath", { fg = palette.violet })
    set_hl("StartifySlash", { link = "StartifyPath" })
    set_hl("StartifyFile", { fg = palette.green })
  end

  if config.plugins.whichkey then
    -- set_hl("WhichKey", { bg = palette.bg_alt, fg = dark_theme and palette.blue or palette.red })
    -- set_hl("WhichKeyGroup", { bg = palette.bg_alt, fg = palette.magenta })
    -- set_hl("WhichKeyDesc", { bg = palette.bg_alt, fg = palette.magenta })
    -- -- set_hl("WhichKeySeparator", { link = "Separator" })
    -- set_hl("WhichKeySeparator", { link = "SeparatorSubtle" })
    -- set_hl("WhichKeyFloat", { link = "NormalFloat" })
    -- -- set_hl("WhichKeyBorder", { link = "NormalFloatBgAltBorder" })
    -- set_hl("WhichKeyValue", { bg = palette.bg_alt, fg = palette.grey })
    set_hl("WhichKey", { bg = palette.bg, fg = dark_theme and palette.blue or palette.red })
    set_hl("WhichKeyGroup", { bg = palette.bg, fg = palette.magenta })
    set_hl("WhichKeyDesc", { bg = palette.bg, fg = palette.magenta })
    -- set_hl("WhichKeySeparator", { link = "Separator" })
    set_hl("WhichKeySeparator", { link = "SeparatorSubtle" })
    set_hl("WhichKeyFloat", { link = "NormalFloat" })
    -- set_hl("WhichKeyBorder", { link = "NormalFloatBgAltBorder" })
    set_hl("WhichKeyBorder", { link = "NormalFloatBorder" })
    -- set_hl("WhichKeyValue", { bg = palette.bg_alt, fg = palette.grey })
    set_hl("WhichKeyValue", { bg = palette.bg, fg = palette.grey })
  end

  if config.plugins.nvim_tree then
    set_hl("NvimTreeFolderName", { fg = dark_theme and palette.blue or palette.base8, bold = true })
    set_hl("NvimTreeRootFolder", { fg = palette.green })
    set_hl("NvimTreeEmptyFolderName", { fg = palette.fg_alt, bold = true })
    set_hl("NvimTreeSymlink", { fg = "fg", underline = true })
    set_hl("NvimTreeExecFile", { fg = palette.green, bold = true })
    set_hl("NvimTreeImageFile", { fg = dark_theme and palette.blue or palette.red })
    set_hl("NvimTreeOpenedFile", { fg = palette.fg_alt })
    set_hl("NvimTreeSpecialFile", { fg = "fg", underline = true })
    set_hl("NvimTreeMarkdownFile", { fg = "fg", underline = true })

    set_hl("NvimTreeGitDirty", { link = "DiffModifiedGutter" })
    set_hl("NvimTreeGitStaged", { link = "DiffModifiedGutter" })
    set_hl("NvimTreeGitMerge", { link = "DiffModifiedGutter" })
    set_hl("NvimTreeGitRenamed", { link = "DiffModifiedGutter" })
    set_hl("NvimTreeGitNew", { link = "DiffAddedGutter" })
    set_hl("NvimTreeGitDeleted", { link = "DiffRemovedGutter" })

    set_hl("NvimTreeIndentMarker", { link = "IndentGuide" })
    set_hl("NvimTreeOpenedFolderName", { link = "NvimTreeFolderName" })
  end

  if config.plugins.lspsaga then
    set_hl("SagaShadow", { bg = "bg" })
    set_hl("LspSagaDiagnosticHeader", { fg = palette.red })

    set_hl("LspSagaDiagnosticBorder", { link = "Normal" })
    set_hl("LspSagaDiagnosticTruncateLine", { link = "Normal" })
    set_hl("LspFloatWinBorder", { link = "Normal" })
    set_hl("LspSagaBorderTitle", { link = "Title" })
    set_hl("TargetWord", { link = "Error" })
    set_hl("ReferencesCount", { link = "Title" })
    set_hl("ReferencesIcon", { link = "Special" })
    set_hl("DefinitionCount", { link = "Title" })
    set_hl("TargetFileName", { link = "Comment" })
    set_hl("DefinitionIcon", { link = "Special" })
    set_hl("ProviderTruncateLine", { link = "Normal" })
    set_hl("LspSagaFinderSelection", { link = "Search" })
    set_hl("DiagnosticTruncateLine", { link = "Normal" })
    set_hl("DefinitionPreviewTitle", { link = "Title" })
    set_hl("LspSagaShTruncateLine", { link = "Normal" })
    set_hl("LspSagaDocTruncateLine", { link = "Normal" })
    set_hl("LineDiagTuncateLine", { link = "Normal" })
    set_hl("LspSagaCodeActionTitle", { link = "Title" })
    set_hl("LspSagaCodeActionTruncateLine", { link = "Normal" })
    set_hl("LspSagaCodeActionContent", { link = "Normal" })
    set_hl("LspSagaRenamePromptPrefix", { link = "Normal" })
    set_hl("LspSagaRenameBorder", { link = "Bold" })
    set_hl("LspSagaHoverBorder", { link = "Bold" })
    set_hl("LspSagaSignatureHelpBorder", { link = "Bold" })
    set_hl("LspSagaCodeActionBorder", { link = "Bold" })
    set_hl("LspSagaDefPreviewBorder", { link = "Bold" })
    set_hl("LspLinesDiagBorder", { link = "Bold" })
  end

  -- bufferline {{{

  if config.plugins.bufferline then
    set_hl("BufferLineErrorDiagnosticSelected", { link = "ErrorMsg" })
    set_hl("BufferLineWarningDiagnosticSelected", { link = "WarningMsg" })
    set_hl("BufferLineInfoDiagnosticSelected", { link = "MoreMsg" })
    set_hl("BufferLineHintDiagnosticSelected", { link = "Msg" })
    set_hl("BufferLineErrorSelected", { link = "Bold" })
    set_hl("BufferLineWarningSelected", { link = "Bold" })
    set_hl("BufferLineInfoSelected", { link = "Bold" })
    set_hl("BufferLineHintSelected", { link = "Bold" })
    set_hl("BufferLinePick", { link = "Error" })
    set_hl("BufferLinePickSelected", { link = "Error" })
    set_hl("BufferLinePickVisible", { link = "Error" })
    set_hl("BufferLineError", { sp = "NONE" })
    set_hl("BufferLineWarning", { sp = "NONE" })
    set_hl("BufferLineInfo", { sp = "NONE" })
    set_hl("BufferLineHint", { sp = "NONE" })
    set_hl("BufferLineErrorDiagnostic", { sp = "NONE" })
    set_hl("BufferLineWarningDiagnostic", { sp = "NONE" })
    set_hl("BufferLineInfoDiagnostic", { sp = "NONE" })
    set_hl("BufferLineHintDiagnostic", { sp = "NONE" })
    set_hl("BufferLineFill", { bg = "bg" })
    set_hl("BufferLineTabSeparator", { bg = "bg" })
    set_hl("TabLineFill", { bg = "bg" })
  end

  -- }}}

  -- mason {{{

  if config.plugins.mason then
    set_hl("MasonHighlight", { fg = palette.blue })
    set_hl("MasonHighlightSecondary", { fg = palette.blue })
    set_hl("MasonHighlightBlockBold", { link = "IncSearch" })
    set_hl("MasonHighlightBlockSecondary", { fg = palette.blue })
    set_hl("MasonHighlightBlockBoldSecondary", { link = "IncSearch" })
    set_hl("MasonHeader", { link = "IncSearch" })
    set_hl("MasonHeaderSecondary", { link = "IncSearch" })
    set_hl("MasonMutedBlock", { bg = "bg" })
    set_hl("MasonHighlightBlock", { link = "IncSearch" })
  end

  -- }}}

  -- lazy {{{

  --  -- TODO: setup lazy integration
  --  --
  -- if config.plugins.lazy then
  --  set_hl("LazyButton", { bg = "bg" })
  -- end
  set_hl("LazyButton", { bg = "bg" })

  -- }}}

  -- dropbar {{{

  --  -- TODO: setup dropbar integration
  --  --
  -- if config.plugins.dropbar then
  --  set_hl("DropBarMenuCurrentContext", { link = "Visual" })
  -- end
  set_hl("DropBarMenuCurrentContext", { link = "Visual" })

  -- }}}

  -- search_nvim {{{

  if config.plugins.search_nvim then
    set_hl("ActiveSearchTab", { link = "IncSearch" })
    set_hl("FailedSearchTab", { link = "Error" })
    set_hl("InactiveSearchTab", { fg = palette.fg_alt, bg = palette.bg_alt })
    set_hl("WaitingSearchTab", { link = "Warning" })
  end

  -- }}}

  -- neotree {{{

  if config.plugins.neotree then
    -- set_hl("NeoTreeFileNameOpened", { fg = palette.fg, bg = palette.dark_blue })
    -- set_hl("NeoTreeTabInactive", { fg = palette.fg_alt, bg = palette.bg_alt })
    -- set_hl("NeoTreeTabActive", { fg = palette.blue, bg = palette.bg, bold = true, italic = true })
    -- set_hl("NeoTreeTabSeparatorInactive", { fg = palette.base0, bg = palette.bg_alt })
    -- set_hl("NeoTreeTabSeparatorActive", { fg = palette.base0, bg = palette.bg_alt })
   --  set_hl("NeoTreeGitModified", { fg = palette.orange, bold = true })
   --  -- set_hl("NeoTreeFloatNormal", { link = "NormalFloatNoBg" })
    set_hl("NeoTreeFileNameOpened", { fg = palette.fg, bg = palette.dark_blue })
    set_hl("NeoTreeTabInactive", { fg = palette.fg_alt, bg = palette.bg })
    set_hl("NeoTreeTabActive", { fg = palette.blue, bg = palette.bg, bold = true, italic = false })
    set_hl("NeoTreeTabSeparatorInactive", { fg = palette.base0, bg = palette.bg })
    set_hl("NeoTreeTabSeparatorActive", { fg = palette.base0, bg = palette.bg })
    set_hl("NeoTreeGitModified", { fg = palette.orange, bold = true })
    -- set_hl("NeoTreeFloatNormal", { link = "NormalFloatNoBg" })
  end

  -- }}}

  -- go_nvim {{{

  if config.plugins.go_nvim then
    set_hl("goCoveragePartial", { fg = palette.blue, bg = palette.bg })
    set_hl("goCoverageUncovered", { link = "Error" })
    set_hl("goCoverageCovered", { link = "String" })
  end

  -- }}}

  -- noice {{{

  if config.plugins.noice then
    set_hl("LspSignatureActiveParameter", { link = "IncSearch" })
    set_hl("NoiceMini", { link = "Comment" })
    -- set_hl("NoiceCmdlinePopupBorder", { fg = palette.blue, bg = palette.bg })
    -- set_hl("NoiceCmdlinePopupBorderSearch", { fg = palette.yellow, bg = palette.bg })
    -- set_hl("NoiceCmdlinePopupBorderSearch", { link = "DiagnosticSignWarn" })
    -- set_hl("NoiceCmdlinePopup", { bg = palette.bg })
    -- set_hl("NoiceCmdlinePopup", { link = "Normal" })
    -- set_hl("NoiceCmdlinePopupBorder", { link = "DiagnosticSignInfo" })
    -- set_hl("NoiceSplit", { link = "NormalFloat" })
    set_hl("NoiceSplitBorder", { link = "NormalFloatBorder" })
  end

  -- }}}

  -- highlight_undo{{{

  if config.plugins.highlight_undo then
    set_hl("HighlightUndo", { link = "IncSearch" })
  end

  -- }}}

  -- vim_visual_multi{{{

  if config.plugins.vim_visual_multi then
    set_hl("MultiCursor", { link = "VM_Extend" })
    set_hl("VM_Insert", { link = "Visual" })
  end

  -- }}}

  -- gitsigns{{{

  if config.plugins.gitsigns then
    set_hl("GitSignsAddInline", { link = "DiffAdded" })
    set_hl("GitSignsDeleteInline", { link = "DiffRemoved" })
    set_hl("GitSignsChangeInline", { link = "DiffModified" })
  end

  -- }}}

end

return doom_one

-- vim: fdm=marker:
