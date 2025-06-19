local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

local function dtstamp()
	local date = os.date "!%Y%m%dT%H%M%SZ"
	return sn(nil, { t(date) })
end

local dtstamp_snippet = {
	t "DTSTAMP:",
	d(1, dtstamp),
	i(0),
}

return {
	s({
		trig = "^DTSTAMP:",
		trigEngine = "pattern",
		name = "DTSTAMP",
		description = "Insert current datetime-stamp in UTC format",
	}, dtstamp_snippet),
	s({ trig = "dts" }, dtstamp_snippet),
}
