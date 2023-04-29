
function scan_lock_file(query, cb)
  local files = vim.fs.find(query, {
    upward = true
  })

  for index, filePath in pairs(files) do
    cb(vim.fs.dirname(filePath))
  end
end

function check_node_dependency(root, tool, dep)
  local cmd = string.format('cd %s && %s why %s', root, tool, dep)

  -- TODO use vim.fn.system?
  vim.cmd(string.format('call system("%s")', cmd))

  if (vim.v.shell_error == 1) then
    return false
  else
    return true
  end
end

function check_node_package(root, dep)
  local found = vim.fs.find(dep, {
    path = root .. "/node_modules",
    type = "directory"
  })

  return #found > 0
end

function find_project_root()
  local found = {}

  scan_lock_file('yarn.lock', function(root)
    if (check_node_package(root, 'vitest')) then
      found.vitest = root
    end

    if (check_node_package(root, 'jest')) then
      found.jest = root
    end
  end)

  scan_lock_file('package-lock.json', function(root)
    if (check_node_package(root, 'vitest')) then
      found.vitest = root
    end

    if (check_node_package(root, 'jest')) then
      found.jest = root
    end
  end)

  if (found.jest) then
    configure_jest()
  end

  if (found.vitest) then
    configure_vitest()
  end
end

function configure_vitest()
  print('configure vitest')
end

function configure_jest()
  print('configure jest')
end

return {
  find_project_root = find_project_root
}
