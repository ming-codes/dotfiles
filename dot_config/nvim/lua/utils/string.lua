return {
  split = function(str, match)
    local lines = {}

    for chunk in str:gmatch(match) do
      table.insert(lines, chunk)
    end

    return lines
  end,
  trim = function(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
  end
}
