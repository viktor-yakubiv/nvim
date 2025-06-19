local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local function expand(s)
	local tw = vim.api.nvim_buf_get_option(0, "textwidth")
	local n = math.floor(tw / s:len())
	return t(string.rep(s, n))
end

return {
	s({ trig = "^%-+", trigEngine = "pattern" }, expand "-"),
	s({ trig = "^%=+", trigEngine = "pattern" }, expand "="),
}
