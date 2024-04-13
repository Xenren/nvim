return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "eslint-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "pyright",
        "black",
        "flake8",
        "pylint",
        "mypy",
        "debugpy",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "markdown",
        "json",
      },
    },
  },

  -- python plugins
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      require("lint").linters_by_ft = {
        python = {
          "flake8",
          "mypy",
          "pylint",
        },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = "*.py",
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-python").setup "usr/bin/python3"
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      name = { "venv", ".venv" },
      auto_refresh = false,
    },
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<CMD>VenvSelect<CR>", desc = { "Open Venv Selector" } },
      { "<leader>vc", "<CMD>VenvSelectCached<CR>", desc = { "Retrieve Cached Venv" } },
    },
  },

  -- general frontend plugins
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "js",
      "jsx",
      "javascript",
      "javascriptreact",
      "ts",
      "tsx",
      "typescript",
      "typescriptreact",
      "html",
      "react",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
