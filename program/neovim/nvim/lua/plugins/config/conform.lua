require("conform").setup({
  format_after_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
  formatters_by_ft = {
    go = { "goimports", "gofmt", "golangci-lint" },
    lua = { "stylua" },
    ["*"] = { "trim_whitespace", "autocorrect" },
    dart = { "dart_format" },
    json = { "jq" },
    nix = { "nixfmt", "nixpkgs-fmt" },
    elixir = { "mix" },
    gleam = { "gleam" },
    markdown = { "markdownlint" },
  },
  notify_on_error = true,
  notify_no_formatters = true,
  log_level = vim.log.levels.ERROR,
})
