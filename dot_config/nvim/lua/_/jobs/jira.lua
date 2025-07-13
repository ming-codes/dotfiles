local Async = require('plenary.async')
local Job = require('plenary.job')

local M = {}

local acli = Async.wrap(function(args, callback)
  Job:new({
    command = 'acli',
    args = args,
    on_exit = function(job)
      callback(vim.json.decode(table.concat(job:result())))
    end
  }):start()
end, 2)

---View a JIRA ticket
---@param item string JIRA ticket number
M.view = function(item)
  return acli({ 'jira', 'workitem', 'view', '--json', item })
end

---Query JIRA ticket
---@param jql string JQL query string
---@param fields table fields to return
M.search = function(jql, fields)
  return acli({ 'jira', 'workitem', 'search', '--json', '--jql', jql, '--fields', table.concat(fields) })
end

return M
