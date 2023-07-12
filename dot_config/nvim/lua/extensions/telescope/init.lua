return {
  git_diff = function(opts)
    local make_entry = require "telescope.make_entry"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local str = require "utils.string"

    local cwd = vim.F.if_nil(opts.cwd, vim.fn.getcwd())
    local ref = str.trim(vim.fn.system("git rev-parse --abbrev-ref " .. opts.ref))
    local git_command = { "git", "--no-pager", "diff", ref, "--name-only", "--relative", "--", "." }

    pickers
        .new(opts, {
          prompt_title = "> git diff " .. ref,
          finder = finders.new_oneshot_job(git_command, opts),
          previewer = conf.file_previewer(opts),
          sorter = conf.file_sorter(opts),
        })
        :find()
  end
}
