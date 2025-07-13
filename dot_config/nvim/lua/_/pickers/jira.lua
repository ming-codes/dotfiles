local Async = require('snacks.picker.util.async')
local Job = require('plenary.job')

local M = {}

local function is_branch_exist(branch, cb)
  Job:new({
    command = "git",
    args = {
      "show-ref", "--quiet", "refs/heads/" .. "mai"
    },
    on_exit = function(job, code, signal)
      if code == 1 then
        cb(false)
      else
        cb(true)
      end
    end
  }):start()
end

function M.search()
  Snacks.picker({
    preview = {
      type = "file",
      ft = "markdown"
    },
    finder = function(opts, ctx)
      return function(add) -- add is an async function
        local self = ctx.async

        -- "assignee = currentUser() AND Sprint in openSprints()"
        Job:new({
          command = 'acli',
          args = { 'jira', 'workitem', 'search', '--json', '--jql', 'assignee = currentUser()', '-f', table.concat({ "summary", "description", "status" }, ',') },
          on_exit = function(job)
            local items = vim.json.decode(table.concat(job:result()))
            local max_key = 0
            local max_status = 0

            table.foreachi(items, function(idx, item)
              max_key = math.max(max_key, #item.key)
              max_status = math.max(max_status, #item.fields.status.name)
            end)

            table.foreachi(items, function(idx, item)
              add({
                idx = idx,
                key = item.key,
                summary = item.fields.summary,
                description = item.fields.description,
                status = item.fields.status.name,
                text = item.key,
                max_key = max_key,
                max_status = max_status,
              })
            end)

            self:resume()
          end
        }):start()

        self:suspend()
      end
    end,
    format = function(item, picker)
      local full_key = Snacks.picker.util.align(item.key, item.max_key) .. " "
      local full_status = Snacks.picker.util.align(item.status, item.max_status) .. " "
      local key_spacer = string.sub(full_key, string.len(item.key) + 1)
      local status_spacer = string.sub(full_status, string.len(item.status) + 1)

      return { { item.key, "TabLineSel" }, { key_spacer }, { item.status }, { status_spacer }, { item.summary, offset = 1 } }
    end,
    confirm = coroutine.wrap(function(picker, item)
      local target = item.key .. "/" .. string.gsub(item.summary, " ", "_")

      picker:close()

      Snacks.debug.inspect(target)
      -- Git branch <name> main
      -- !git show-ref
      -- !git show-ref --quiet refs/heads/master
      -- vim.cmd(('WorkspacesOpen %s'):format(item.name))
    end),
  })
end

return M
