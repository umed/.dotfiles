function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^mine') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

-- vim.cmd('command! ReloadConfig lua ReloadConfig()')
