return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "pyright", "black", "flake8", "pylint",
        "mypy", "debugpy",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },

  {
    'psf/black',
    ft = "python",
    config = function ()
      vim.api.nvim_create_autocmd( { "BufWritePost" }, {
        pattern = "*.py",
        callback = function()
         vim.cmd("!black %")
      end,
      })
    end
  },

  {
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function ()
      require('lint').linters_by_ft = {
        python = {
          'flake8',
          'mypy',
          'pylint',
        }
      }

      vim.api.nvim_create_autocmd( { "BufWritePost" }, {
        pattern = "*.py",
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },

  {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function ()
      require('dap-python').setup('usr/bin/python3')
    end
  },
}
