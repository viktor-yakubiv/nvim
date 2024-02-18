local plugins = require 'yakubiv.plugins'
plugins.autoload()

plugins.use {
	--- Syntax
	{ 'dannywillems/vim-icalendar', name = "icalendar", ft = "icalendar" },
}

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.keymaps'

plugins.load()
