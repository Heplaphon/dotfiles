-- %:p:t:r gives filename
local wk = require('whichkey_setup')

local keymap = {
    
    l = { -- set a nested structure
        name = '+Language',
        d = {'<Cmd>!make fp=% buildandrun<CR>', 'Build and run'},
        b = {'<Cmd>!make fp=% build<CR>', 'build current file'},
        r = {'<Cmd>!make path=%:h fn=%:p:t:r run<CR>', 'Run built file'},
    }
}

wk.register_keymap('leader', keymap)

