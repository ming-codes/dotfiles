return {
  assign = function(to, from)
    for key, value in pairs(from) do
      to[key] = value
    end
  end,
  each = function(tbl, it)
    for key, value in pairs(tbl) do
      it(value, key)
    end
  end,
  i_each = function(tbl, it)
    for key, value in ipairs(tbl) do
      it(value, key)
    end
  end,
  map = function(tbl, it)
    local ret = {}

    for key, value in pairs(tbl) do
      ret[key] = it(value, key)
    end

    return ret
  end,
  i_map = function(tbl, it)
    local ret = {}

    for key, value in ipairs(tbl) do
      ret[key] = it(value, key)
    end

    return ret
  end,
  filter = function(tbl, it)
    local ret = {}

    for key, value in pairs(tbl) do
      if (it(value, key)) then
        ret[key] = value
      end
    end

    return ret
  end,
  i_flat_map = function(tbl, it)
    local ret = {}

    for key, value in ipairs(tbl) do
      local child = it(value, key)

      for _, value in ipairs(child) do
        ret[#ret + 1] = value
      end
    end

    return ret
  end,
  groupBy = function(tbl, it)
    local ret = {}

    for key, value in pairs(tbl) do
      local group = it(value, key)

      if (ret[group] == nil) then
        ret[group] = {}
      end

      table.insert(ret[group], value)
    end

    return ret
  end,
  join = function(tbl, delimiter)
    return table.concat(tbl, delimiter or ",")
  end,
  pick = function(tbl, ...)
  end,
  slice = function(tbl, from, to)
    local ret = {}

    if (to == nil) then
      to = #tbl + 1
    elseif (to < 0) then
      to = #tbl + to + 1
    end

    if (from == nil) then
      from = 1
    end

    for index, value in ipairs(tbl) do
      if (index >= from and index < to) then
        table.insert(ret, value)
      end
    end

    return ret
  end,
  find = function(tbl, it)
    for key, value in pairs(tbl) do
    end
  end
}
