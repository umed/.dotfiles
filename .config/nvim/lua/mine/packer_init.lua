local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer_init.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Add you plugins here:
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        tag = 'nightly'
    }

    -- UI
    use 'navarasu/onedark.nvim'

    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use {'glepnir/dashboard-nvim'}

    -- Tools
    use 'nvim-treesitter/nvim-treesitter'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'bfrg/vim-cpp-modern'

    use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function() require("toggleterm").setup() end }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'p00f/clangd_extensions.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)

