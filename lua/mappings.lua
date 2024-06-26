require "nvchad.mappings"

local map = vim.keymap.set

-- Nvchad Overrides
map("n", "<leader>vt", function()
  require("nvchad.term").new { pos = "vsp", size = 0.3 }
end, { desc = "Terminal New Vertical Window" })

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ww", ":w<CR>", { desc = "Save" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })
map("n", "<leader>we", ":q<CR>", { desc = "Quit" })
map("n", "<leader>w`", ":q!<CR>", { desc = "Force Quit" })
map("n", "<leader>ol", ":!open <c-r><c-a><CR>", { desc = "Open Link" })
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
map("n", "<leader>wb", ":Nvdash<CR>", { desc = "Display Dashboard" })

-- Word Searching
map("n", "<leader>se", ":noh<CR>", { desc = "Remove Search Highlighting" })
map("n", "<C-k>", "*", { desc = "Search Word Under Cursor" })
map("n", "<C-j>", "#", { desc = "Previous Word Under Cursor" })
map("n", "<leader>fr", ":%s/", { desc = "Find and Replace" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Debugging
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map("n", "<leader>dz", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
map("n", "<leader>ds", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
map("n", "<leader>dx", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
map("n", "<leader>d.", "<cmd>Telescope dap list_breakpoints<cr>")
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
map("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
map("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
map("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end)
map("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
map("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
map("n", "<leader>d?", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end)
map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
map("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
map("n", "<leader>de", function()
  require("telescope.builtin").diagnostics { default_text = ":E:" }
end)
