local dict_path = vim.fn.stdpath "data" .. "/dicts/"

return {
	"uga-rosa/cmp-dictionary",
	enabled = false,
	opts = {
		paths = { dict_path },
		first_case_insensitive = true,
		max_number_items = 4,
		dict = {
			spelllang = {
				en = dict_path .. "en.dict",
				uk = dict_path .. "uk.dict",
			},
		},
	},
}
