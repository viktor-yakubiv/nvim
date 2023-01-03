local colors = {
  black   = 0,
  maroon  = 1,
  green   = 2,
  olive   = 3,
  navy    = 4,
  purple  = 5,
  teal    = 6,
  silver  = 7,
  gray    = 8,
  red     = 9,
  lime    = 10,
  yellow  = 11,
  blue    = 12,
  fuchsia = 13,
  aqua    = 14,
  white   = 15,
}

return {
  normal = {
    a = { fg = colors.white, bg = colors.navy, gui = 'bold' },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.silver, bg = colors.black },
  },
  insert = { a = { fg = colors.white, bg = colors.green, gui = 'bold' } },
  visual = { a = { fg = colors.white, bg = colors.purple, gui = 'bold' } },
  replace = { a = { fg = colors.white, bg = colors.maroon, gui = 'bold' } },
  inactive = {
    a = { fg = colors.silver, bg = colors.gray, gui = 'bold' },
    b = { fg = colors.gray, bg = colors.black },
    c = { fg = colors.silver, bg = colors.black },
  },
}
