local M = {
	"fgheng/winbar.nvim",
	event = "VeryLazy",
}

function M.config()
	require("winbar").setup({
		enabled = true,

		show_file_path = true,
		show_symbols = true,

		icons = {
			file_icon_default = "",
			seperator = ">",
			editor_state = "●",
			lock_icon = "",
		},

		exclude_filetype = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"alpha",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"qf",
		},
	})
end

return M
