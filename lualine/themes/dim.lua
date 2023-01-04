local C = {
  Black         = 0,
  DarkRed       = 1,
  DarkGreen     = 2,
  Brown         = 3,
  DarkBlue      = 4,
  DarkMagenta   = 5,
  DarkCyan      = 6,
  LightGrey     = 7,
  Silver        = 7,
  Grey          = 8,
  DarkGrey      = 8,
  BrightRed     = 9,
  Red           = 9,
  BrightGreen   = 10,
  Green         = 10,
  Yellow        = 11,
  Blue          = 12,
  BrightBlue    = 12,
  Magenta       = 13,
  BrightMagenta = 13,
  Cyan          = 14,
  BrightCyan    = 14,
  White         = 15,
}

if vim.o.background == 'light' then
  local Background = C.LightGrey
  local Major = C.Black
  local Minor = C.DarkGrey
else 
  local Background = C.Black
  local Major = C.White
  local Minor = C.LightGrey
end

return {
  normal = {
    a = { fg = C.White, bg = C.DarkBlue, gui = 'bold' },
    b = { fg = Major, bg = Background },
    c = { fg = Minor, bg = Background },
  },
  insert = { a = { fg = C.White, bg = C.DarkGreen, gui = 'bold' } },
  visual = { a = { fg = C.White, bg = C.DarkMagenta, gui = 'bold' } },
  replace = { a = { fg = C.White, bg = C.DarkRed, gui = 'bold' } },
  inactive = {
    a = { fg = C.LightGrey, bg = C.DarkGrey, gui = 'bold' },
    b = { fg = Minor, bg = Background },
    c = { fg = Major, bg = Background },
  },
}
