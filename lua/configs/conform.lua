local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    ts = { "prettier" },
    tsx = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    js = { "prettier" },
    jsx = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    react = { "prettier" },
    scss = { "prettier" },
    yaml = { "prettier" },
    python = { "black", "isort" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
