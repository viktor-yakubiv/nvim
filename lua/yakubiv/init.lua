local plugins = require 'yakubiv.plugins'
plugins.autoload()

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.syntax'
-- require 'yakubiv.languages'
require 'yakubiv.language-servers'
require 'yakubiv.keymaps'
require 'yakubiv.navigation'
require 'yakubiv.editing'

plugins.load()
