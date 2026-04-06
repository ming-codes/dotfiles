return {
  -- Cursor = {},
  -- CursorLine = {},

  Normal = { bg = 'NONE' },
  NormalFloat = { bg = 'NONE' },

  jsonQuote = { link = 'NORMAL' },
  typescriptDOMDocProp = { link = 'NORMAL' },
  typescriptArrayMethod = { link = 'NORMAL' },
  typescriptDateStaticMethod = { link = 'NORMAL' },
  typescriptFuncCallArg = { link = 'NORMAL' },

  -- embeded
  Special = { fg = "#8700af" },
  htmlTag = { link = 'Special' },
  htmlTagName = { link = 'Special' },
  tsxTagName = { link = 'Special' },
  tsxCloseString = { link = 'Special' },

  -- Identifier = { fg = 'NONE', ctermfg = 14, underline = true },
  -- ^ this is common, property names are Identifiers
  Directory = { fg = '#0087af' },

  Statement = { fg = '#0087af', bold = false },
  -- property names: object literal, jsx attribute
  tsxAttrib = { link = 'Statement' },

  Keyword = { fg = "#0087af", bold = true },
  typescriptFuncKeyword = { link = "Keyword" },

  -- braces and brackets
  Delimiter = { fg = '#0087af' }, -- () [] {}
  typescriptBraces = { link = 'Delimiter' },
  typescriptParens = { link = 'Delimiter' },
  cssBraces = { link = 'Delimiter' },
  PreProc = { link = 'Delimiter' },

  -- type
  Type = { fg = '#d70087', bold = true },
  typescriptTypeReference = { link = 'Type' },

  typescriptCall = { fg = 'NONE' },
  Function = { fg = 'NONE' },

  Value = { fg = '#008700' },
  String = { link = 'Value' },
  Boolean = { link = 'Value' },
  cssAttrRegion = { link = 'Value' },
  cssTextAttr = { link = 'Value' },

  LualineNormalA = { fg = '#4d4d4c', bg = '#f5f5f5', bold = true },
  LualineNormalB = { fg = '#efefef', bg = '#3e999f', },
  LualineNormalC = { fg = '#eeeeee', bg = '#005f87' },

  LualineInsertA = { fg = '#4271ae', bg = '#f5f5f5', bold = true },
  LualineInsertB = { link = 'LualineNormalB' },
  LualineInsertC = { link = 'LualineNormalC' },

  LualineVisualA = { fg = '#f5f5f5', bg = '#d75f00', bold = true },
  LualineVisualB = { link = 'LualineNormalB' },
  LualineVisualC = { link = 'LualineNormalC' },

  LualineReplaceA = { fg = '#f5f5f5', bg = '#d7005f', bold = true },
  LualineReplaceB = { link = 'LualineNormalB' },
  LualineReplaceC = { link = 'LualineNormalC' },

  LualineInactiveA = { fg = '#4d4d4c', bg = "#f5f5f5", bold = true },
  LualineInactiveB = { fg = '#4d4d4c', bg = "#f5f5f5" },
  LualineInactiveC = { fg = '#4d4d4c', bg = "#f5f5f5" },

  LualineTabActive = { fg = '#005f87', bg = '#eeeeee' },
  LualineTabInactive = { fg = '#eeeeee', bg = '#0087af' },
}
