local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
local markdown_lint_rule_config_filename = "markdownlint-cli2.yaml"
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", dir .. "/" .. markdown_lint_rule_config_filename, "--" },
      },
    },
  },
}
