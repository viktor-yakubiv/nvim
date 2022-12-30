local function source(s)
  return vim.cmd.source(string.format('%s/%s', vim.fn.stdpath('config'), s))
end

return source
