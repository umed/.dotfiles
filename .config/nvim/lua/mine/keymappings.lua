local keymap = require('mine.core.keymap')

local nmap, imap, xmap, tmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.tmap
local silent, noremap, expr, remap = keymap.silent, keymap.noremap, keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd, cu = keymap.cmd, keymap.cu

nmap({ '<Leader><Leader>', cmd('lua ReloadConfig()<CR>'), opts(nnoremap, silent) })

nmap({ '<Leader>p', cmd(':BufferLineCyclePrev'), opts(nnoremap, silent) })
nmap({ '<Leader>n', cmd(':BufferLineCycleNext'), opts(nnoremap, silent) })

nmap({ '<c-P>', cmd('lua require("fzf-lua").files()<CR>'), opts(nnoremap, silent) })

nmap({ '<c-N>', cmd(':NvimTreeToggle'), opts(nnoremap, silent) })
nmap({ '<Leader>m', cmd(':NvimTreeFindFile'), opts(nnoremap, silent) })
