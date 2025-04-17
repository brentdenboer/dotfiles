return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      dprint = {
        condition = function(ctx)
          return vim.fs.find({ "dprint.json" }, {
            path = ctx.filename,
            upward = true,
          })[1]
        end,
      },
    },
    formatters_by_ft = {
      javascript = { "dprint" },
      javascriptreact = { "dprint" },
      typescript = { "dprint" },
      typescriptreact = { "dprint" },
      vue = { "dprint" },
      json = { "dprint" },
      jsonc = { "dprint" },
      markdown = { "dprint" },
      toml = { "dprint" },
      yaml = { "dprint" },
      css = { "dprint" },
    },
  },
}
