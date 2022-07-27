local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
vim.opt.cursorline = true

-- vim.opt.directory = cache_dir .. 'swag/'
-- vim.opt.undodir = cache_dir .. 'undo/'
-- vim.opt.backupdir = cache_dir .. 'backup/'
-- vim.opt.viewdir = cache_dir .. 'view/'
-- vim.opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
