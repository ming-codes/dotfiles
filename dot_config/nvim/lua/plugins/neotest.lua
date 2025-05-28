return {
  {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    opts = function()
      return {
        summary = {
          mappings = {
          }
        },
        adapters = {
          require('neotest-vitest')({
            -- vitestCommand = "npx vitest -- -w"
          }),
          require('neotest-jest')({
            jestCommand = "npm test -- --runInBand --testTimeout=60000",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        }
      }
    end,
    config = true
  }
}
