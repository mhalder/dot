local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

local function clock()
	return " " .. os.date("%H:%M")
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

function M.config()
	if vim.g.started_by_firenvim then
		return
	end

	require("lualine").setup({
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "lazy" } },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" } } },
			lualine_b = { "branch", "diff" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { spaces, "encoding", "filetype" },
			lualine_z = { "location", progress },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "diagnostics", sources = { "nvim_diagnostic" } },
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ "filename", path = 1, symbols = { modified = "[+]", readonly = "ro", unnamed = "doe" } },
				{
					function()
						local navic = require("nvim-navic")
						local ret = navic.get_location()
						return ret:len() > 2000 and "navic error" or ret
					end,
					cond = function()
						if package.loaded["nvim-navic"] then
							local navic = require("nvim-navic")
							return navic.is_available()
						end
					end,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_x = {},
			lualine_y = {
				{
					function()
						return require("lazy.status").updates()
					end,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
				{
					function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return " " .. ms .. "ms"
					end,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_z = { clock },
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { "nvim-tree" },
	})
end

return M
