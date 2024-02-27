local plugins = require 'yakubiv.plugins'
plugins.autoload()

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.syntax'
require 'yakubiv.keymaps'
require 'yakubiv.navigation'

plugins.load()
