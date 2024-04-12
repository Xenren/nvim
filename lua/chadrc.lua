-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
--
---@type ChadrcConfig
local M = {}

M.ui = {
  hl_override = {
    NvDashAscii = {
      bg = "green",
      fg = "red",
    },

    Normal = {
      bg = {"black", -4},
    },

    -- status line coloring
    St_NormalMode = {
      fg = "green",
    },

    St_gitIcons = {
      fg = "green",
    },

    St_file_info = {
      fg = "green",
    },
  },

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = nil,
  },

	theme = "gatekeeper",
  theme_toggle = { "gatekeeper", "decay" },

  nvdash = {
      load_on_startup = true,

      header = {
"   (`\\ .-') /`   ('-.                          _   .-')       ('-.        .-. .-')     ('-.               .-. .-')   ",
"    `.( OO ),' _(  OO)                        ( '.( OO )_   _(  OO)       \\  ( OO )   ( OO ).-.           \\  ( OO )  ",
",--./  .--.  (,------.   .-----.  .-'),-----. ,--.   ,--.)(,------.       ;-----.\\   / . --. /   .-----. ,--. ,--.  ",
"|      |  |   |  .---'  '  .--./ ( OO'  .-.  '|   `.'   |  |  .---'       | .-.  |   | \\-.  \\   '  .--./ |  .'   /  ",
"|  |   |  |,  |  |      |  |('-. /   |  | |  ||         |  |  |           | '-' /_).-'-'  |  |  |  |('-. |      /,  ",
"|  |.'.|  |_)(|  '--.  /_) |OO  )\\_) |  |\\|  ||  |'.'|  | (|  '--.        | .-. `.  \\| |_.'  | /_) |OO  )|     ' _) ",
"|         |   |  .--'  ||  |`-'|   \\ |  | |  ||  |   |  |  |  .--'        | |  \\  |  |  .-.  | ||  |`-'| |  .   \\   ",
"|   ,'.   |   |  `---.(_'  '--'\\    `'  '-'  '|  |   |  |  |  `---.       | '--'  /  |  | |  |(_'  '--'\\ |  |\\   \\  ",
"'--'   '--'   `------'   `-----'      `-----' `--'   `--'  `------'       `------'   `--' `--'   `-----' `--' '--'  ","                  _____                                                                  _____                      ";
"                 ( ___ )                                                                ( ___ )                     ";
"                  |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   |                      ";
"                  |   |     ▄▀▀▄  ▄▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄  ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄    |   |                      ";
"                  |   |    █    █   █ ▐  ▄▀   ▐ █  █ █ █ █   █   █ ▐  ▄▀   ▐ █  █ █ █    |   |                      ";
"                  |   |    ▐     ▀▄▀    █▄▄▄▄▄  ▐  █  ▀█ ▐  █▀▀█▀    █▄▄▄▄▄  ▐  █  ▀█    |   |                      ";
"                  |   |         ▄▀ █    █    ▌    █   █   ▄▀    █    █    ▌    █   █     |   |                      ";
"                  |   |        █  ▄▀   ▄▀▄▄▄▄   ▄▀   █   █     █    ▄▀▄▄▄▄   ▄▀   █      |   |                      ";
"                  |   |      ▄▀  ▄▀    █    ▐   █    ▐   ▐     ▐    █    ▐   █    ▐      |   |                      ";
"                  |   |     █    ▐     ▐        ▐                   ▐        ▐           |   |                      ";
"                  |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___|                      ";
"                 (_____)                                                                (_____)                     ";
      },

      buttons = {
        { "  Find File", "Spc f f", "Telescope find_files" },
        { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
        { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
        { "  Bookmarks", "Spc m a", "Telescope marks" },
        { "  Themes", "Spc t h", "Telescope themes" },
        { "  Mappings", "Spc c h", "NvCheatsheet" },
      },
  },
}

return M
