local keymap = require('mine.core.keymap')

local nmap, imap, xmap, tmap, vmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.tmap, keymap.vmap
local silent, noremap, expr, remap = keymap.silent, keymap.noremap, keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd, cu = keymap.cmd, keymap.cu

local noremap_silent_opts = opts(noremap, silent)
local noremap_opts = opts(noremap)

nmap({ '<Leader><Leader>', cmd('lua ReloadConfig()<CR>'), noremap_silent_opts })

nmap({ '<Leader>q', cmd(':q'), noremap_silent_opts })
nmap({ '<Leader>n', cmd(':BufferNext'), noremap_silent_opts })
nmap({ '<Leader>N', cmd(':BufferPrevious'), noremap_silent_opts })
-- nmap({ '<Leader>N', cmd(':BufferLineCyclePrev'), noremap_silent_opts })
-- nmap({ '<Leader>n', cmd(':BufferLineCycleNext'), noremap_silent_opts })
nmap({ '<Leader>w', cmd(':bd'), noremap_silent_opts })
nmap({ '<leader><tab>', '<C-S-6>', noremap_silent_opts })
nmap({ '<leader>h', '<C-w>h', noremap_silent_opts })
nmap({ '<leader>j', '<C-w>j', noremap_silent_opts })
nmap({ '<leader>k', '<C-w>k', noremap_silent_opts })
nmap({ '<leader>l', '<C-w>l', noremap_silent_opts })
nmap({ '<leader><esc>', '<c-w>q', noremap_silent_opts })

nmap({ '<c-P>', cmd('FzfLua files<CR>'), noremap_silent_opts })
nmap({ '<leader>f', cmd('FzfLua grep_project<CR>'), noremap_silent_opts })

nmap({ '<c-N>', cmd(':NvimTreeToggle'), noremap_silent_opts })
nmap({ '<Leader>m', cmd(':NvimTreeFindFile'), noremap_silent_opts })


nmap({ '<leader>t', cmd(':ToggleTerm'), noremap_opts })
tmap({ '<leader>t', cmd(':ToggleTerm'), noremap_opts })
tmap({ '<Esc>', '<C-\\><c-n>', noremap_opts })

imap({ 'jj', '<Esc>', noremap_opts })
vmap({ '<leader>f', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', noremap_opts })
-- vmap({ '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', noremap_opts })
vmap({ '<leader>r', '"hy:%s/<C-r>h//g<left><left>', noremap_opts })
nmap({ '<esc><esc>', cmd('noh'), noremap_opts })

if vim.loop.os_uname().sysname == 'Darwin' then
    nmap({ '<leader>y', '"+y', noremap_silent_opts })
    nmap({ '<leader>p', '"+p', noremap_silent_opts })
--    set clipboard=unnamed
else
    
end
