local plugins = require 'yakubiv.plugins'
plugins.autoload()

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.syntax'
require 'yakubiv.keymaps'
require 'yakubiv.navigation'
require 'yakubiv.editing'

require 'yakubiv.language-servers.markup'
require 'yakubiv.language-servers.css'
require 'yakubiv.language-servers.javascript'

plugins.load()
