return {
	"b0o/SchemaStore.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvim-lua/plenary.nvim",
	"folke/which-key.nvim",
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"mbbill/undotree",

	{
		"SmiteshP/nvim-navic",
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = {
			auto_open = false,
			use_diagnostic_signs = true,
		},
	},
}

-- {
-- 	"ahmedkhalf/project.nvim",
-- 	config = function()
-- 		require("project_nvim").setup({})
-- 	end,
-- },
-- use "akinsho/toggleterm.nvim"
--
-- use {
--   "w0rp/ale",
--   ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
--   cmd = "ALEEnable",
--   config = "vim.cmd[[ALEEnable]]"
-- }
--
-- use "EdenEast/nightfox.nvim"
-- use "navarasu/onedark.nvim"
-- use "rgzee/dark.nvim"
-- use "folke/tokyonight.nvim"
-- use "lunarvim/darkplus.nvim"
-- use "lunarVim/colorschemes"
--
-- use "nanotee/luv-vimdocs"
-- use "milisims/nvim-luaref"
--
-- -- treesitter
-- use {
--   "nvim-treesitter/nvim-treesitter",
--   run = function()
--     pcall(require("nvim-treesitter.install").update { with_sync = true })
--   end,
-- }
--
-- -- additional text objects via treesitter
-- use {
--   "nvim-treesitter/nvim-treesitter-textobjects",
--   after = "nvim-treesitter",
-- }
--
-- -- treesitter playground
-- use {
--   "nvim-treesitter/playground",
--   after = "nvim-treesitter",
-- }
--
-- -- autopairs
-- use {
--    "windwp/nvim-autopairs",
--   after = "nvim-treesitter",
-- }
--
-- -- treesitter rainbow
-- use {
--   "p00f/nvim-ts-rainbow",
--   after = "nvim-treesitter",
-- }
--
-- -- treesitter commentstring
-- use {
--   "JoosepAlviste/nvim-ts-context-commentstring",
--   after = "nvim-treesitter",
-- }
--
-- -- coding related plugins
-- use "ahmedkhalf/project.nvim"
-- use "kyazdani42/nvim-tree.lua"
-- use "kyazdani42/nvim-web-devicons"
-- use "tpope/vim-rhubarb"
-- use "lewis6991/gitsigns.nvim"
-- use "nvim-lualine/lualine.nvim"
-- use "lukas-reineke/indent-blankline.nvim"
-- use "tpope/vim-sleuth"
-- use "AckslD/swenv.nvim"
-- use "ThePrimeagen/git-worktree.nvim"
-- use "ThePrimeagen/harpoon"
-- use "ggandor/leap.nvim"
-- use "fgheng/winbar.nvim"
-- use "SmiteshP/nvim-navic"
-- use "cljoly/telescope-repo.nvim"
