local wk = require('which-key')
local o = vim.o

o.expandtab = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})

-- require("whichkey_setup").config{
--     hide_statusline = false,
--     default_keymap_settings = {
--         silent=true,
--         noremap=true,
--     },
--     default_mode = 'n',
-- }
-- 
-- local keymap = {
--     
--     w = {':w!<CR>', 'save file'}, -- set a single command and text
--     j = 'split args', -- only set a text for an already configured keymap
--     ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
--     f = { -- set a nested structure
--         name = '+find',
--         b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
--         h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
--         c = {
--             name = '+commands',
--             c = {'<Cmd>Telescope commands<CR>', 'commands'},
--             h = {'<Cmd>Telescope command_history<CR>', 'history'},
--         },
--         q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
--         g = {'<Cmd>Telescope live_grep<CR>', 'grep curr dir'}
--     },
--     g = {
--         name = '+git',
--         g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
--         c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
--         b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
--         s = {'<Cmd>Telescope git_status<CR>', 'status'},
--     }
-- }
-- wk.register_keymap('leader', keymap)

wk.add({
    { "<leader>f", group = "file"},
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep files", mode = "n" },
    { "<leader>g", group = "git"},
    { "<leader>gg", "<cmd>Telescope git_commits<cr>", desc = "Commits", mode = "n"},
    { "<leader>gc", "<cmd>Telescope git_bcommits<cr>", desc = "Bcommits", mode = "n"},
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches", mode = "n"},
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status", mode = "n"},
    {
        mode = { "n", "v" },
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w<cr>", desc = "Write"},
    }
})

