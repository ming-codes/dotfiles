local C = require('_.colors.palette')

local M = {}

M.syntax = {
  Comment = { fg = C.overlay1, italic = true },
  SpecialComment = { fg = C.teal },

  String = { fg = C.peach },
  StringEscape = { fg = C.teal },

  Character = { link = 'String' },
  StringSpecial = { link = 'String' },

  Boolean = { fg = C.mauve },
  Number = { fg = C.mauve },
  Float = { link = 'Number' },
  Decimal = { link = 'Number' },
  Hex = { link = 'Number' },
  Octal = { link = 'Number' },
  Binary = { link = 'Number' },

  Constant = { fg = C.peach },
  BuiltinConstant = { link = 'Constant' },

  Identifier = { fg = C.text },
  Variable = { link = 'Identifier' },
  VariableBuiltin = { fg = C.mauve, italic = true },

  Function = { fg = C.blue },
  FunctionName = { link = 'Function' },
  FunctionBuiltin = { fg = C.blue },

  Method = { link = 'Function' },
  Closure = { link = 'Function' },

  Operator = { fg = C.teal },
  OperatorKeyword = { fg = C.teal },
  UnaryOperator = { link = 'Operator' },
  BinaryOperator = { link = 'Operator' },
  TernaryOperator = { link = 'Operator' },

  Keyword = { fg = C.mauve },
  KeywordFunction = { link = 'Keyword' },
  KeywordReturn = { link = 'Keyword' },
  KeywordCoroutine = { link = 'Keyword' },

  Conditional = { link = 'Keyword' },
  ConditionalElse = { link = 'Keyword' },
  Repeat = { link = 'Keyword' },
  RepeatWhile = { link = 'Keyword' },
  Yield = { link = 'Keyword' },
  Await = { link = 'Keyword' },

  Statement = { fg = C.mauve },
  Label = { fg = C.mauve },

  Exception = { fg = C.red },
  Raise = { link = 'Exception' },

  Type = { fg = C.yellow },
  TypeBuiltin = { link = 'Type' },
  TypeClass = { link = 'Type' },
  TypeLabel = { link = 'Type' },
  TypeQualifier = { link = 'Type' },

  Class = { fg = C.yellow },
  ClassName = { link = 'Class' },

  Structure = { fg = C.yellow },
  Attribute = { fg = C.peach },

  Namespace = { fg = C.peach },

  Decorator = { fg = C.peach },
  DecoratorBrackets = { fg = C.overlay1 },

  Property = { fg = C.teal },
  PropertyBuiltin = { link = 'Property' },
  Member = { link = 'Property' },

  Field = { link = 'Property' },
  FieldName = { link = 'Property' },

  Enum = { fg = C.yellow },
  EnumMember = { fg = C.peach },
  EnumKey = { link = 'EnumMember' },

  Tag = { fg = C.mauve },
  TagAttribute = { fg = C.teal },
  TagDelimiter = { fg = C.sky },

  Parameter = { fg = C.rosewater },
  ParameterBuiltin = { link = 'Parameter' },
  Argument = { link = 'Parameter' },

  Punctuation = { fg = C.subtext1 },
  PunctuationBracket = { fg = C.overlay1 },
  PunctuationDelimiter = { fg = C.overlay1 },
  PunctuationSpecial = { fg = C.teal },

  Delimiter = { fg = C.subtext1 },
  Special = { fg = C.peach },
  SpecialChar = { link = 'Special' },
  SpecialKey = { link = 'Special' },
  Regexp = { fg = C.red },

  Todo = { fg = C.base, bg = C.yellow, bold = true },

  PreProc = { fg = C.pink },
  PreCondit = { link = 'PreProc' },
  Include = { link = 'PreProc' },
  Define = { link = 'PreProc' },
  Macro = { link = 'PreProc' },

  Title = { link = 'Title' },
  Underlined = { link = 'Underlined' },

  Ignore = { fg = C.overlay1 },
  Folded = { link = 'Folded' },

  ModeMsg = { link = 'MoreMsg' },
  MoreMsg = { link = 'MoreMsg' },
  Question = { link = 'Question' },
}

M.markup = {
  MarkupHeading = { fg = C.lavender, bold = true },
  MarkupHeadingDelimiter = { fg = C.mauve },

  MarkupBold = { bold = true },
  MarkupBoldDelimiter = { fg = C.peach },
  MarkupItalic = { italic = true },
  MarkupItalicDelimiter = { fg = C.peach },
  MarkupUnderline = { underline = true },
  MarkupStrikethrough = { strikethrough = true },

  MarkupLink = { fg = C.blue, underline = true },
  MarkupLinkText = { link = 'MarkupLink' },
  MarkupLinkDestination = { fg = C.sapphire },

  MarkupList = { fg = C.teal },
  MarkupListCheckbox = { fg = C.green },
  MarkupListMarker = { fg = C.pink },

  MarkupCode = { fg = C.teal },
  MarkupCodeDelimiter = { fg = C.surface2, bg = C.surface0 },
  MarkupRaw = { link = 'MarkupCode' },
  MarkupRawBlock = { fg = C.teal },
  MarkupInlineCode = { link = 'MarkupCode' },

  MarkupQuote = { fg = C.rosewater, italic = true },
  MarkupBlockQuote = { link = 'MarkupQuote' },

  MarkupTable = { fg = C.text },
  MarkupTableRow = { fg = C.subtext1 },
}

return M
