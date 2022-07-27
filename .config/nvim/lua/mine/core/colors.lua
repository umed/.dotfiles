local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

require('onedark').setup {
  style = 'cool',
}
require('onedark').load()
require('lualine').setup {
  options = {
    theme = 'onedark'
  }
}

require("bufferline").setup{}
