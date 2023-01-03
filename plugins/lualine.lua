local loaded, lualine = pcall(require, 'lualine')
if not loaded then
  return
end

lualine.setup {
  theme = '16color',
}
