local dictionary = require 'cmp_dictionary'

local dict_path = vim.fn.stdpath('data') .. '/dicts/'

dictionary.setup {
	dic = {
		spelllang = {
			en = dict_path .. 'en.dict',
			uk = dict_path .. 'uk.dict',
		},
	},
}
