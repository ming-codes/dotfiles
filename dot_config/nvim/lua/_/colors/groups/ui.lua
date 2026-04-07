local C = require('_.colors.palette')

local M = {}

M.ui = {
  Normal = { bg = C.mantle },
  NormalFloat = { bg = C.surface0 },
  NormalNC = { bg = C.mantle },
  Cursor = { reverse = true },
  CursorLine = { bg = C.surface0 },
  CursorLineNr = { bold = true, fg = C.text },
  CursorColumn = { link = 'CursorLine' },
  LineNr = { fg = C.overlay0 },
  LineNrAbove = { fg = C.overlay1 },
  LineNrBelow = { fg = C.overlay1 },

  VertSplit = { fg = C.surface1, bg = C.mantle },
  WinBar = { fg = C.subtext1 },
  WinBarNC = { fg = C.overlay1 },
  WinSeparator = { link = 'VertSplit' },

  Folded = { fg = C.blue, bg = C.surface0 },
  FoldColumn = { fg = C.overlay1 },
  SignColumn = { bg = C.mantle },

  Pmenu = { bg = C.surface0 },
  PmenuSel = { bg = C.surface1, bold = true },
  PmenuSbar = { bg = C.surface1 },
  PmenuThumb = { bg = C.overlay0 },

  WildMenu = { link = 'PmenuSel' },
  QuickFixLine = { link = 'PmenuSel' },

  MatchParen = { bg = C.surface1, bold = true },
  ParenMatch = { link = 'MatchParen' },

  SpellBad = { undercurl = true, sp = C.red },
  SpellCap = { undercurl = true, sp = C.yellow },
  SpellRare = { undercurl = true, sp = C.peach },
  SpellLocal = { undercurl = true, sp = C.teal },

  Visual = { bg = C.surface1 },
  VisualNOS = { bg = C.surface2, bold = true },

  Search = { bg = C.surface0, fg = C.peach, bold = true },
  IncSearch = { link = 'Search' },
  CurSearch = { link = 'Search' },

  Substitute = { bg = C.teal, fg = C.crust },

  Title = { fg = C.green, bold = true },
  Bold = { bold = true },
  Italic = { italic = true },
  BoldItalic = { bold = true, italic = true },
  Underlined = { underline = true },
  Strikethrough = { strikethrough = true },

  Question = { fg = C.yellow, bold = true },
  MoreMsg = { fg = C.blue },
  WarningMsg = { fg = C.yellow },
  ErrorMsg = { fg = C.red, bold = true },
  Error = { link = 'ErrorMsg' },

  Directory = { fg = C.blue },
  Tag = { fg = C.peach },
  FloatTitle = { link = 'Title' },

  NonText = { fg = C.overlay1 },
  Whitespace = { fg = C.overlay1 },
  EndOfBuffer = { link = 'NonText' },
  Conceal = { fg = C.overlay1 },

  SpecialKey = { fg = C.teal },

  MiniIndentscopeSymbol = { fg = C.overlay1 },
  IndentBlanklineChar = { fg = C.surface1 },
  IndentBlanklineContextChar = { fg = C.teal },
}

M.terminal = {
  TermCursor = { reverse = true },
  TermCursorNC = { link = 'TermCursor' },
}

M.diff = {
  DiffAdd = { bg = '#1a3d2e' },
  DiffChange = { bg = '#2d2a1f' },
  DiffDelete = { bg = '#3d1f1f' },
  DiffText = { bg = '#2d351a' },
  DiffAdded = { link = 'DiffAdd' },
  DiffChanged = { link = 'DiffChange' },
  DiffDeleted = { link = 'DiffDelete' },
  DiffRemoved = { link = 'DiffDelete' },
  DiffAddedGutter = { link = 'DiffAdd' },
  DiffChangedGutter = { link = 'DiffChange' },
  DiffDeletedGutter = { link = 'DiffDelete' },
  DiffRemovedGutter = { link = 'DiffDelete' },
  diffOldFile = { link = 'DiffChange' },
  diffNewFile = { link = 'DiffAdd' },
  diffFile = { fg = C.blue },
  diffLine = { fg = C.text },
  diffIndexLine = { fg = C.peach },
}

M.diagnostics = {
  DiagnosticError = { fg = C.red },
  DiagnosticWarn = { fg = C.yellow },
  DiagnosticInfo = { fg = C.blue },
  DiagnosticHint = { fg = C.teal },
  DiagnosticOk = { fg = C.green },

  DiagnosticUnderlineError = { undercurl = true, sp = C.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = C.yellow },
  DiagnosticUnderlineInfo = { undercurl = true, sp = C.blue },
  DiagnosticUnderlineHint = { undercurl = true, sp = C.teal },
  DiagnosticUnderlineOk = { undercurl = true, sp = C.green },

  DiagnosticVirtualTextError = { fg = C.red },
  DiagnosticVirtualTextWarn = { fg = C.yellow },
  DiagnosticVirtualTextInfo = { fg = C.blue },
  DiagnosticVirtualTextHint = { fg = C.teal },

  DiagnosticFloatingError = { link = 'DiagnosticError' },
  DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
  DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
  DiagnosticFloatingHint = { link = 'DiagnosticHint' },

  DiagnosticSignError = { link = 'DiagnosticError' },
  DiagnosticSignWarn = { link = 'DiagnosticWarn' },
  DiagnosticSignInfo = { link = 'DiagnosticInfo' },
  DiagnosticSignHint = { link = 'DiagnosticHint' },
}

return M
