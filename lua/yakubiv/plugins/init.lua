local spec_map = {}

local function extend(spec, extension)
	local extended = vim.tbl_deep_extend("force", spec, extension)
	for key, value in pairs(extended) do
		spec[key] = value
	end
end

local function attach_methods(spec)
	spec.extend = extend
	spec.setup = function(opts)
		spec.opts = vim.tbl_deep_extend("force", spec.opts or {}, opts)
	end
end

local M = setmetatable({}, {
	__index = function(_, k)
		if spec_map[k] == nil then
			local spec = {}
			attach_methods(spec)
			spec_map[k] = spec
		end

		return spec_map[k]
	end,
})

return M
