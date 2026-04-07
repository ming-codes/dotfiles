local C = require('_.colors.palette')

local M = {}

M.lsp = {
  LspCodeLens = { fg = C.overlay1 },
  LspCodeLensSeparator = { fg = C.overlay1 },

  LspReferenceText = { bg = C.surface0 },
  LspReferenceRead = { bg = C.surface0 },
  LspReferenceWrite = { bg = C.surface0 },

  LspInlayHint = { fg = C.overlay1, italic = true },
  LspInlayHintParameter = { link = 'LspInlayHint' },
  LspInlayHintType = { link = 'LspInlayHint' },

  LspSignatureActiveParameter = { bg = C.surface0, bold = true },

  LspWorkspaceSymbol = { fg = C.blue },
  LspWorkspaceSymbolDefault = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolClass = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolConstant = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolEnum = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolEnumMember = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolEvent = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolField = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolFile = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolFolder = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolFunction = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolInterface = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolMethod = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolModule = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolNamespace = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolOperator = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolPackage = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolProperty = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolReference = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolSnippet = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolStruct = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolTypeParameter = { link = 'LspWorkspaceSymbol' },
  LspWorkspaceSymbolVariable = { link = 'LspWorkspaceSymbol' },

  LspDiagnosticsDefaultError = { link = 'DiagnosticError' },
  LspDiagnosticsDefaultWarning = { link = 'DiagnosticWarn' },
  LspDiagnosticsDefaultInformation = { link = 'DiagnosticInfo' },
  LspDiagnosticsDefaultHint = { link = 'DiagnosticHint' },
  LspDiagnosticsDefaultOk = { link = 'DiagnosticOk' },

  LspDiagnosticsVirtualTextError = { link = 'DiagnosticVirtualTextError' },
  LspDiagnosticsVirtualTextWarning = { link = 'DiagnosticVirtualTextWarn' },
  LspDiagnosticsVirtualTextInformation = { link = 'DiagnosticVirtualTextInfo' },
  LspDiagnosticsVirtualTextHint = { link = 'DiagnosticVirtualTextHint' },

  LspDiagnosticsFloatingError = { link = 'DiagnosticFloatingError' },
  LspDiagnosticsFloatingWarning = { link = 'DiagnosticFloatingWarn' },
  LspDiagnosticsFloatingInformation = { link = 'DiagnosticFloatingInfo' },
  LspDiagnosticsFloatingHint = { link = 'DiagnosticFloatingHint' },

  LspDiagnosticsSignError = { link = 'DiagnosticSignError' },
  LspDiagnosticsSignWarning = { link = 'DiagnosticSignWarn' },
  LspDiagnosticsSignInformation = { link = 'DiagnosticSignInfo' },
  LspDiagnosticsSignHint = { link = 'DiagnosticSignHint' },

  LspDiagnosticsUnderlineError = { link = 'DiagnosticUnderlineError' },
  LspDiagnosticsUnderlineWarning = { link = 'DiagnosticUnderlineWarn' },
  LspDiagnosticsUnderlineInformation = { link = 'DiagnosticUnderlineInfo' },
  LspDiagnosticsUnderlineHint = { link = 'DiagnosticUnderlineHint' },

  LspDiagnosticsMessageError = { fg = C.red },
  LspDiagnosticsMessageWarning = { fg = C.yellow },
  LspDiagnosticsMessageInformation = { fg = C.blue },
  LspDiagnosticsMessageHint = { fg = C.teal },
}

M.codelens = {
  LspCodeLens = { link = 'LspCodeLens' },
  LspCodeLensSeparator = { link = 'LspCodeLensSeparator' },
}

return M
