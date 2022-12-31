local use_dev = false

if use_dev then
	-- use the local project
	vim.opt.runtimepath:prepend(vim.fn.expand("~/projects/lazy.nvim"))
else
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
		vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
	end
	vim.opt.rtp:prepend(lazypath)
end

require("lazy").setup("plugins", {
	defaults = { lazy = false },
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = false },
	diff = {
		cmd = "terminal_git",
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},
})
vim.keymap.set("n", "<leader>lz", "<cmd>:Lazy<cr>")
