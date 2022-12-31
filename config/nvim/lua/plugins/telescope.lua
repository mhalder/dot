return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },

	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"cljoly/telescope-repo.nvim",
		"nvim-telescope/telescope-project.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.load_extension("fzf")
		telescope.load_extension("repo")
		-- telescope.load_extension("git_worktree")
		-- telescope.load_extension("harpoon")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["jj"] = actions.close,
						["<C-u>"] = false,
					},
					n = {
						["jj"] = actions.close,
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent cd %s", dir))
						end,
					},
				},
				pickers = {
					telescope.extensions.project.project({}),
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
	end,
}
