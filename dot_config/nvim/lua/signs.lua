local table = require("utils.table")

function process(entry)
  local name, text = unpack(table.slice(entry, 1, 3))
  local opts = {
    name,
    text = text or " ",
    texthl = "",
    linehl = "",
    numhl = "",
  }

  table.each(table.slice(entry, 3), function(key)
    opts[key] = name
  end)

  -- table.each({ "texthl", "linehl", "numhl" }, function(key)
  --   if (config[key] ~= nil) then
  --     opts[key] = config[key]
  --   end
  --   if (config[key] == true) then
  --     return name
  --   elseif (config[key] == nil) then
  --     return ""
  --   else
  --     return config[key]
  --   end
  -- end)

  return opts
end

return table.map({
  -- TODO: fine tune how this gets loaded
  { "DapBreakpoint",         "",  "texthl" },
  { "DapStopped",            "󰁕", "texthl" },
  { "DapBreakpointRejected", "",  "texthl" },
  { "DiagnosticSignError",   "",  "texthl" }, -- FIXME: the background is ugly
  { "DiagnosticSignWarn",    "",  "texthl" },
  { "DiagnosticSignHint",    "󰌵", "texthl" },
  { "DiagnosticSignInfo",    "󰋼", "texthl" },

  
  -- vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "WarningMsg" })
  -- vim.fn.sign_define("DapStopped", { text = "▶", texthl = "MatchParen", linehl = "CursorLine" })


  { "FoldClosed",            "" },
  { "FoldOpened",            "" },
  { "FoldSeparator",         " " },

  -- ActiveLSP = "",
  -- ActiveTS = "",
  -- ArrowLeft = "",
  -- ArrowRight = "",
  -- Bookmarks = "",
  -- BufferClose = "󰅖",
  -- DapBreakpoint = "",
  -- DapBreakpointCondition = "",
  -- DapBreakpointRejected = "",
  -- DapLogPoint = ".>",
  -- DapStopped = "󰁕",
  -- Debugger = "",
  -- DefaultFile = "󰈙",
  -- Diagnostic = "󰒡",
  -- DiagnosticError = "",
  -- DiagnosticHint = "󰌵",
  -- DiagnosticInfo = "󰋼",
  -- DiagnosticWarn = "",
  -- Ellipsis = "…",
  -- FileNew = "",
  -- FileModified = "",
  -- FileReadOnly = "",
  -- FoldClosed = "",
  -- FoldOpened = "",
  -- FoldSeparator = " ",
  -- FolderClosed = "",
  -- FolderEmpty = "",
  -- FolderOpen = "",
  -- Git = "󰊢",
  -- GitAdd = "",
  -- GitBranch = "",
  -- GitChange = "",
  -- GitConflict = "",
  -- GitDelete = "",
  -- GitIgnored = "◌",
  -- GitRenamed = "➜",
  -- GitSign = "▎",
  -- GitStaged = "✓",
  -- GitUnstaged = "✗",
  -- GitUntracked = "★",
  -- LSPLoaded = "",
  -- LSPLoading1 = "",
  -- LSPLoading2 = "󰀚",
  -- LSPLoading3 = "",
  -- MacroRecording = "",
  -- Package = "󰏖",
  -- Paste = "󰅌",
  -- Refresh = "",
  -- Search = "",
  -- Selected = "❯",
  -- Session = "󱂬",
  -- Sort = "󰒺",
  -- Spellcheck = "󰓆",
  -- Tab = "󰓩",
  -- TabClose = "󰅙",
  -- Terminal = "",
  -- Window = "",
  -- WordFile = "󰈭",
}, process)
