return {
  ensure = function(bin, version)
  end,
  where = function(name, version)
    -- asdf where name
    -- asdf list name
  end,
  list = function(name)
    local str = require("utils.string")
    local table = require("utils.table")
    local list = str.split(vim.fn.system('asdf list ' .. name), "[^\r\n]+")
    local home = os.getenv("HOME")

    return table.map(list, function(entry)
      local lhs = string.sub(entry, 1, 2)
      local rhs = string.sub(entry, 3)
      local active = false
      local version = str.split(rhs, "%d+")
      local major, minor, patch = unpack(version)

      if (lhs == " *") then
        active = true
      end

      return {
        rhs,
        active = active,
        path = string.format("%s/.asdf/installs/%s/%s", home, name, rhs),
        version = {
          table.join(version, "."),
          major = major,
          minor = minor,
          patch = patch
        }
      }
    end)
  end
}
