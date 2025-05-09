local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    ts = { "prettierd" },
    tsx = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    js = { "prettierd" },
    jsx = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    markdown = { "prettierd" },
    react = { "prettierd" },
    scss = { "prettierd" },
    yaml = { "prettierd" },
    -- python = { "black", "isort" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
