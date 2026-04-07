local C = require('_.colors.palette')

local M = {}

M.treesitter = {
  -- Comments
  ['@comment'] = { link = 'Comment' },
  ['@comment.documentation'] = { link = 'SpecialComment' },

  -- Punctuation
  ['@punctuation'] = { link = 'Punctuation' },
  ['@punctuation.bracket'] = { link = 'PunctuationBracket' },
  ['@punctuation.delimiter'] = { link = 'PunctuationDelimiter' },
  ['@punctuation.special'] = { link = 'PunctuationSpecial' },

  -- Literals
  ['@string'] = { link = 'String' },
  ['@string.documentation'] = { fg = C.text },
  ['@string.escape'] = { link = 'StringEscape' },
  ['@string.regex'] = { link = 'Regexp' },
  ['@string.special'] = { link = 'SpecialString' },

  ['@character'] = { link = 'Character' },
  ['@character.special'] = { link = 'SpecialChar' },

  ['@boolean'] = { link = 'Boolean' },
  ['@number'] = { link = 'Number' },
  ['@float'] = { link = 'Float' },

  -- Functions
  ['@function'] = { link = 'Function' },
  ['@function.builtin'] = { link = 'FunctionBuiltin' },
  ['@function.call'] = { link = 'Function' },
  ['@function.method'] = { link = 'Method' },
  ['@function.macro'] = { fg = C.mauve },

  ['@method'] = { link = 'Method' },
  ['@method.call'] = { link = 'Method' },

  -- Keywords
  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.coroutine'] = { link = 'Keyword' },
  ['@keyword.debug'] = { fg = C.red },
  ['@keyword.directive'] = { link = 'PreProc' },
  ['@keyword.export'] = { link = 'Keyword' },
  ['@keyword.flow'] = { link = 'Keyword' },
  ['@keyword.function'] = { link = 'KeywordFunction' },
  ['@keyword.import'] = { link = 'Include' },
  ['@keyword.operator'] = { link = 'OperatorKeyword' },
  ['@keyword.repeat'] = { link = 'Repeat' },
  ['@keyword.return'] = { link = 'KeywordReturn' },
  ['@keyword.storage'] = { fg = C.mauve, bold = true },

  ['@conditional'] = { link = 'Conditional' },
  ['@conditional.ternary'] = { link = 'Conditional' },
  ['@repeat'] = { link = 'Repeat' },

  -- Types
  ['@type'] = { link = 'Type' },
  ['@type.builtin'] = { link = 'TypeBuiltin' },
  ['@type.definition'] = { link = 'Type' },
  ['@type.qualifier'] = { link = 'TypeQualifier' },

  ['@class'] = { link = 'Class' },

  ['@struct'] = { link = 'Structure' },
  ['@enum'] = { link = 'Enum' },
  ['@enumMember'] = { link = 'EnumMember' },

  ['@interface'] = { fg = C.yellow },
  ['@typeParameter'] = { fg = C.sapphire },

  -- Namespaces
  ['@namespace'] = { link = 'Namespace' },
  ['@module'] = { link = 'Namespace' },
  ['@symbol'] = { fg = C.peach },

  -- Variables
  ['@variable'] = { link = 'Variable' },
  ['@variable.builtin'] = { link = 'VariableBuiltin' },
  ['@variable.parameter'] = { link = 'Parameter' },
  ['@variable.parameter.declaration'] = { fg = C.rosewater },

  ['@constant'] = { link = 'Constant' },
  ['@constant.builtin'] = { link = 'BuiltinConstant' },
  ['@constant.macro'] = { fg = C.mauve },

  -- Properties
  ['@property'] = { link = 'Property' },
  ['@property.definition'] = { link = 'Property' },
  ['@property.declaration'] = { link = 'Property' },

  ['@field'] = { link = 'Field' },
  ['@field.documentation'] = { fg = C.subtext1 },

  ['@attribute'] = { link = 'Attribute' },
  ['@attribute.builtin'] = { fg = C.mauve },

  -- Operators
  ['@operator'] = { link = 'Operator' },
  ['@unary.operator'] = { link = 'UnaryOperator' },
  ['@binary.operator'] = { link = 'BinaryOperator' },

  -- Special
  ['@special'] = { link = 'Special' },
  ['@special.formula'] = { link = 'Special' },
  ['@special.special'] = { link = 'Special' },

  -- Tags (HTML, JSX, etc.)
  ['@tag'] = { link = 'Tag' },
  ['@tag.attribute'] = { link = 'TagAttribute' },
  ['@tag.delimiter'] = { link = 'TagDelimiter' },

  -- Markup (Markdown, etc.)
  ['@markup'] = { link = 'Markup' },
  ['@markup.heading'] = { link = 'MarkupHeading' },
  ['@markup.heading.1'] = { link = 'MarkupHeading' },
  ['@markup.heading.2'] = { link = 'MarkupHeading' },
  ['@markup.heading.3'] = { link = 'MarkupHeading' },
  ['@markup.heading.4'] = { link = 'MarkupHeading' },
  ['@markup.heading.5'] = { link = 'MarkupHeading' },
  ['@markup.heading.6'] = { link = 'MarkupHeading' },
  ['@markup.heading.marker'] = { link = 'MarkupHeadingDelimiter' },

  ['@markup.bold'] = { link = 'MarkupBold' },
  ['@markup.bold.markup'] = { link = 'MarkupBold' },
  ['@markup.italic'] = { link = 'MarkupItalic' },
  ['@markup.italic.markup'] = { link = 'MarkupItalic' },
  ['@markup.strikethrough'] = { link = 'MarkupStrikethrough' },
  ['@markup.underline'] = { link = 'MarkupUnderline' },

  ['@markup.link'] = { link = 'MarkupLink' },
  ['@markup.link.label'] = { link = 'MarkupLink' },
  ['@markup.link.target'] = { link = 'MarkupLinkDestination' },
  ['@markup.link.url'] = { link = 'MarkupLinkDestination' },

  ['@markup.list'] = { link = 'MarkupList' },
  ['@markup.list.checkbox'] = { link = 'MarkupListCheckbox' },
  ['@markup.list.marker'] = { link = 'MarkupListMarker' },

  ['@markup.code'] = { link = 'MarkupCode' },
  ['@markup.code.block'] = { link = 'MarkupRawBlock' },
  ['@markup.raw'] = { link = 'MarkupRaw' },
  ['@markup.raw.block'] = { link = 'MarkupRawBlock' },
  ['@markup.raw.inline'] = { link = 'MarkupInlineCode' },

  ['@markup.quote'] = { link = 'MarkupQuote' },
  ['@markup.table'] = { link = 'MarkupTable' },

  -- Literals
  ['@text'] = { fg = C.text },
  ['@text.strong'] = { link = 'MarkupBold' },
  ['@text.emphasis'] = { link = 'MarkupItalic' },
  ['@text.underline'] = { link = 'MarkupUnderline' },
  ['@text.strike'] = { link = 'MarkupStrikethrough' },
  ['@text.title'] = { link = 'MarkupHeading' },
  ['@text.uri'] = { link = 'MarkupLink' },
  ['@text.literal'] = { link = 'MarkupCode' },
  ['@text.reference'] = { link = 'MarkupLink' },

  -- Others
  ['@definition'] = { fg = C.text },
  ['@definition.constant'] = { link = 'Constant' },
  ['@definition.function'] = { link = 'Function' },
  ['@definition.macro'] = { link = 'Macro' },
  ['@definition.method'] = { link = 'Method' },
  ['@definition.type'] = { link = 'Type' },
  ['@definition.var'] = { link = 'Variable' },

  ['@scope'] = { fg = C.text },
  ['@usage'] = { fg = C.text },

  ['@reference'] = { fg = C.text },
  ['@reference.type'] = { link = 'Type' },
  ['@reference.identifier'] = { link = 'Identifier' },

  ['@invalid'] = { fg = C.red, undercurl = true },
  ['@warning'] = { fg = C.yellow },
  ['@danger'] = { fg = C.red },

  -- TSNode under cursors
  ['@node.typeUnderCursor'] = { bg = C.surface0 },
  ['@node.fieldUnderCursor'] = { bg = C.surface0 },
}

M.lsp = {
  ['@lsp.type.boolean'] = { link = 'Boolean' },
  ['@lsp.type.number'] = { link = 'Number' },
  ['@lsp.type.string'] = { link = 'String' },

  ['@lsp.type.function'] = { link = 'Function' },
  ['@lsp.type.method'] = { link = 'Method' },
  ['@lsp.type.class'] = { link = 'Class' },
  ['@lsp.type.interface'] = { fg = C.yellow },
  ['@lsp.type.enum'] = { link = 'Enum' },
  ['@lsp.type.namespace'] = { link = 'Namespace' },
  ['@lsp.type.type'] = { link = 'Type' },
  ['@lsp.type.typeParameter'] = { fg = C.sapphire },

  ['@lsp.type.property'] = { link = 'Property' },
  ['@lsp.type.variable'] = { link = 'Variable' },
  ['@lsp.type.parameter'] = { link = 'Parameter' },
  ['@lsp.type.enumMember'] = { link = 'EnumMember' },
  ['@lsp.type.decorator'] = { link = 'Decorator' },

  ['@lsp.type.comment'] = { link = 'Comment' },
  ['@lsp.type.operator'] = { link = 'Operator' },
  ['@lsp.type.keyword'] = { link = 'Keyword' },
  ['@lsp.type.punctuation'] = { link = 'Punctuation' },

  ['@lsp.mod.declaration'] = { fg = C.green },
  ['@lsp.mod.definition'] = { fg = C.green },
  ['@lsp.mod.readonly'] = { fg = C.peach },
  ['@lsp.mod.static'] = { link = '@lsp.mod.readonly' },
  ['@lsp.mod.implementation'] = { fg = C.sapphire },
  ['@lsp.mod.reference'] = { fg = C.subtext1 },
  ['@lsp.mod.typeHint'] = { fg = C.yellow },
  ['@lsp.mod.defaultLibrary'] = { fg = C.teal, italic = true },
  ['@lsp.mod.builtin'] = { link = '@lsp.mod.defaultLibrary' },
}

return M
