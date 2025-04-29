return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  -- critical
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { side = "right" },
    },
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
        "deno",
        "pyright",
        "black",
        -- "flake8",
        "pylint",
        -- "mypy",
        "debugpy",
        "gopls",
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      automatic_installation = {
        -- These will be configured by separate plugins.
        exclude = {
          "delve",
          "python",
        },
      },
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "stylua",
        "bash",
        "codelldb",
        "php",
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
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
        "go",
        "gomod",
        "gosum",
        "gotmpl",
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tw",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tf",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- general use
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- python plugins
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      require("lint").linters_by_ft = {
        python = {
          -- "flake8",
          -- "mypy",
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
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp",
    keys = {
      { "<leader>vs", "<CMD>VenvSelect<CR>" },
      { "<leader>vc", "<CMD>VenvSelectCached<CR>" },
    },
    ---@type venv-selector.Config
    opts = {
      name = { "venv", ".venv" },
      auto_refresh = false,
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

  -- copilot
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim", cmd = "Copilot" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      model = "claude-3.7-sonnet",
    },
    keys = {
      { "<leader>cw", "<CMD>CopilotChatToggle<CR>", desc = "Copilot Chat Window" },
      { "<leader>ce", "<CMD>CopilotChatExplain<CR>", desc = "Copilot Chat Explain" },
      { "<leader>cc", "<CMD>CopilotChatStop<CR>", desc = "Stop Copilot Output" },
      { "<leader>cr", "<CMD>CopilotChatReset<CR>", desc = "Reset Copilot Chat Window" },
      { "<leader>cM", "<CMD>CopilotChatModels<CR>", desc = "View/Select Available Models" },
      { "<leader>cs", "<CMD>CopilotChatSave<CR>", desc = "Save Copilot Chat History" },
      { "<leader>cl", "<CMD>CopilotChatLoad<CR>", desc = "Load Copilot Chat History" },
      { "<leader>ct", "<CMD>CopilotChatPrompts<CR>", desc = "View/Select Prompt Templates" },
    },
    -- See Commands section for default commands if you want to lazy load on them
    cmd = { "CopilotChatToggle" },
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",

    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre /home/xenren/github/xenren/obsidian-notes/*.md",
      "BufNewFile /home/xenren/github/xenren/obsidian-notes/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see (https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#configuration-options)
    },
    opts = {
      workspaces = {
        {
          name = "obisidian-notes",
          path = "/home/xenren/github/xenren/obsidian-notes/",
        },
      },
      mappings = { -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
    },
  },

  -- -- markdown previewer
  -- {
  --   "toppair/peek.nvim",
  --   build = "deno task --quiet build:fast",
  --
  --   keys = {
  --     {
  --       "<leader>op",
  --       function()
  --         local peek = require "peek"
  --         if peek.is_open() then
  --           peek.close()
  --         else
  --           peek.open()
  --         end
  --       end,
  --       desc = "Peek (Markdown Preview)",
  --     },
  --   },
  --
  --   opts = {
  --     theme = "dark",
  --     app = { vim.env.BROWSER_PATH, "--new-window" },
  --   },
  -- },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  {
    "xenren/nvim-notebook-ui",
    dev = true,
    dir = "~/github/xenren/nvim-plugins/nvim-notebook-ui",
    config = function()
      require("nvim-notebook-ui").setup()
    end,
    cmd = { "JupyterShowCells" }, -- define custom commands
  },
}
