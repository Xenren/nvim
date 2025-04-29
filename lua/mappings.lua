require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Nvchad Overrides
map("n", "<leader>vt", function()
  require("nvchad.term").new { pos = "vsp", size = 0.3 }
end, { desc = "Terminal New Vertical Window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "toggle file explorer" }) -- rebind focus -> toggle
unmap("n", "<C-n>") -- unmap original toggle
unmap("n", "<leader>v")

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ww", ":w<CR>", { desc = "Save" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })
map("n", "<leader>we", ":q<CR>", { desc = "Quit" })
map("n", "<leader>w`", ":q!<CR>", { desc = "Force Quit" })
map(
  "n",
  "<leader>wf",
  ":set eventignore+=BufWritePre | w | set eventignore-=BufWritePre<CR>",
  { desc = "Save w/o Formatting" }
)

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
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map(
  "n",
  "<leader>dz",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Set Conditional Breakpoint" }
)
map(
  "n",
  "<leader>ds",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Set Log Point" }
)
map("n", "<leader>dx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear All Breakpoints" })
map("n", "<leader>d.", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List Breakpoints" })
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Start Or Continue Debugging" })
map("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
map("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
map("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end, { desc = "Disconnect Debugger" })
map("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end, { desc = "Terminate Debugging Session" })
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle Debug Repl" })
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run Last Debug Session" })
map("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end, { desc = "Show Variable Hover Info" })
map("n", "<leader>d?", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "Show Variable Scopes" })
map("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "List Call Stack Frames" })
map("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "List Dap Commands" })
map("n", "<leader>de", function()
  require("telescope.builtin").diagnostics { default_text = ":E:" }
end, { desc = "Show Diagnostics With Telescope" })

-- set conceallevel (used for obsidian ui)
map("n", "<leader>ou", ":set conceallevel=1<cr>", { desc = "Obsidian ui (set conceallevel 1)" })

-- go boilerplate keymaps lol
map("n", "<leader>ge", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Go err check snippet" })
map("n", "<leader>gc", "ictx context.Context, <Esc>", { desc = "Go context argument snippet" })
