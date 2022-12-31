--@diagnostic disable: missing-parameter

local wk = require("which-key")
local util = require("util")

vim.opt.timeoutlen = 300

wk.setup({
	plugins = {
		spelling = {
			enabled = true,
		},
	},
})

wk.register({ vv = { "<esc>", "Quit Insert Mode" } }, { mode = "i" })

local leader = {
	[" "] = { "<cmd>Telescope find_files<cr>", "Find File" },
	[","] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
	[":"] = { "<cmd>Telescope command_history<cr>", "Command History" },
	["/"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },

	["<tab>"] = {
		name = "+tabs",
		d = { "<cmd>tabclose<cr>", "Close Tab" },
		f = { "<cmd>tabfirst<cr>", "First Tab" },
		l = { "<cmd>tablast<cr>", "Last Tab" },
		n = { "<cmd>tabnext<cr>", "Next Tab" },
		p = { "<cmd>tabprevious<cr>", "Previous Tab" },
		["<tab>"] = { "<cmd>tabnew<cr>", "New Tab" },
		["]"] = { "<cmd>tabnext<cr>", "Next Tab" },
		["["] = { "<cmd>tabprevious<cr>", "Previous Tab" },
	},

	b = {
		name = "+buffers",
		b = { "<cmd>e #<cr>", "Switch to Other Buffer" },
		d = { "<cmd>bdelete<cr>", "Delete Buffer" },
		n = { "<cmd>bnext<cr>", "Next Buffer" },
		p = { "<cmd>bprevious<cr>", "Previous Buffer" },
		["["] = { "<cmd>bprevious<cr>", "Previous Buffer" },
		["]"] = { "<cmd>bnext<cr>", "Next Buffer" },
	},

	f = {
		name = "+files",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		n = { "<cmd>enew<cr>", "New File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	},

	-- TODO
	g = {
		name = "+git",
		-- c = { "<Cmd>Telescope git_commits<cr>", "commits" },
		-- b = { "<Cmd>Telescope git_branches<cr>", "branches" },
		-- s = { "<Cmd>Telescope git_status<cr>", "status" },
		-- d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
		b = { "<cmd>Gblame<cr>", "gblame" },
		c = { "<cmd>Gcommit<cr>", "gcommit" },
		d = { "<cmd>Gdiff<cr>", "gdiff" },
		e = { "<cmd>Gvsplit :0<cr>", "gvsplit" },
		f = { "<cmd>Gitv!<cr>", "gitv!" },
		l = { "<cmd>Glog<cr>", "glog" },
		s = { "<cmd>Git<cr>", "gstatus" },
		v = { "<cmd>Gitv<cr>", "gitv" },
		z = {
			function()
				require("util").lazygit()
			end,
			"LazyGit",
		},
	},

	h = {
		name = "+helpers",
		a = { "<cmd>Telescope autocommands<cr>", "Auto Commands" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		f = { "<cmd>Telescope filetypes<cr>", "File Types" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
		k = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
		s = { "<cmd>Telescope highlights<cr>", "Highlight Groups" },
		t = { "<cmd>Telescope builtin<cr>", "Builtin" },
	},

	-- TODO
	j = {
		name = "+sessions/quit",
		d = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop Current Session" },
		j = { "<cmd>q<cr>", "Quit" },
		k = { "<cmd>w<cr>", "Save" },
		l = { "<cmd>wq<cr>", "Save and Quit" },
		r = { [[<cmd>lua require("persistence").load({last=true})<cr>]], "Restore Last Session" },
		s = { [[<cmd>lua require("persistence").load()<cr>]], "Restore Session" },
		[";"] = { "<cmd>qall!<cr>", "Force Quit" },
	},

	-- TODO
	o = {
		name = "+open",
	},

	-- TODO
	p = {
		name = "+projects",
		p = { ":Telescope project<cr>", "Open Project" },
	},

	-- TODO
	s = {
		name = "+search",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep Current Buffer" },
		h = { "<cmd>Telescope command_history<cr>", "Command History" },
		m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
		s = {
			function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				})
			end,
			"Goto Symbol",
		},
	},

	-- TODO
	t = {
		name = "+toggle",
		f = {
			require("plugins.lsp.formatting").toggle,
			"Format on Save",
		},
		n = {
			function()
				util.toggle("relativenumber", true)
				util.toggle("number")
			end,
			"Line Numbers",
		},
		s = {
			function()
				util.toggle("spell")
			end,
			"Spelling",
		},
		u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
		w = {
			function()
				util.toggle("wrap")
			end,
			"Word Wrap",
		},
	},

	-- TODO
	w = {
		name = "+windows",
		H = { "<C-W>5<", "expand-window-left" },
		J = { "<cmd>resize +5<cr>", "expand-window-below" },
		K = { "<cmd>resize -5<cr>", "expand-window-up" },
		L = { "<C-W>5>", "expand-window-right" },
		d = { "<C-W>c", "delete-window" },
		h = { "<C-W>h", "window-lneft" },
		j = { "<C-W>j", "window-below" },
		k = { "<C-W>k", "window-up" },
		l = { "<C-W>l", "window-right" },
		s = { "<C-W>s", "split-window-below" },
		v = { "<C-W>v", "split-window-right" },
		w = { "<C-W>p", "other-window" },
		["2"] = { "<C-W>v", "layout-double-columns" },
		["-"] = { "<C-W>s", "split-window-below" },
		["="] = { "<C-W>=", "balance-window" },
		["|"] = { "<C-W>v", "split-window-right" },
	},

	-- TODO
	x = {
		name = "+errors",
		T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
		l = { "<cmd>lopen<cr>", "Open Location List" },
		q = { "<cmd>copen<cr>", "Open Quickfix List" },
		t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
		tt = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo Trouble" },
		x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
	},
}

wk.register(leader, { prefix = "<leader>" })

-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", term_opt)
--
-- vim.keymap.set("n", "<C-Up>", ":resize -2<cr>", opt)
-- vim.keymap.set("n", "<C-Down>", ":resize +2<cr>", opt)
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opt)
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", opt)
--
-- vim.keymap.set("n", "<S-l>", ":bnext<cr>", opt)
-- vim.keymap.set("n", "<S-h>", ":bprevious<cr>", opt)
-- vim.keymap.set("n", "<C-k>", ":cnext<cr>zz")
-- vim.keymap.set("n", "<C-j>", ":cprev<cr>zz")
-- vim.keymap.set("n", "<leader>k", ":lnext<cr>zz")
-- vim.keymap.set("n", "<leader>j", ":lprev<cr>zz")
--
-- vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<cr>==gi", opt)
-- vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<cr>==gi", opt)
--
-- vim.keymap.set("v", "<", "<gv", opt)
-- vim.keymap.set("v", ">", ">gv", opt)
--
-- vim.keymap.set("v", "<A-j>", ":m .+1<cr>==", opt)
-- vim.keymap.set("v", "<A-k>", ":m .-2<cr>==", opt)
-- vim.keymap.set({ "v", "x" }, "p", '"_dP', opt)
--
-- vim.keymap.set("x", "J", ":move '>+1<cr>gv-gv", opt)
-- vim.keymap.set("x", "K", ":move '<-2<cr>gv-gv", opt)
-- vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv", opt)
-- vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv", opt)
--
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
--
-- -- Move to window using the <ctrl> movement keys
-- vim.keymap.set("n", "<leader>h", "<C-w>h", opt)
-- vim.keymap.set("n", "<leader>j", "<C-w>j", opt)
-- vim.keymap.set("n", "<leader>k", "<C-w>k", opt)
-- vim.keymap.set("n", "<leader>l", "<C-w>l", opt)
--
-- -- Move Lines
-- vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
-- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
-- vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")
-- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi")

-- Easier pasting
-- vim.keymap.set("n", "[p", ":pu!<cr>")
-- vim.keymap.set("n", "]p", ":pu<cr>")

-- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
-- vim.keymap.set("n", "gw", "*N")
-- vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")
--
-- save in insert mode
-- vim.keymap.set("i", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal ciw<cr>a")

-- telescope <ctrl-r> in command line
-- vim.cmd([[cmap <C-R> <Plug>(TelescopeFuzzyCommandSearch)]])

-- better indenting
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

-- vim.keymap.set("n", "<space>cu", function()
-- 	local number = math.random(math.pow(2, 127) + 1, math.pow(2, 128))
-- 	return "i" .. string.format("%.0f", number)
-- end, {
-- 	expr = true,
-- 	desc = "GUID",
-- })
--
-- -- makes * and # work on visual mode too.
-- vim.cmd([[
--   function! g:VSetSearch(cmdtype)
--     let temp = @s
--     norm! gv"sy
--     let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
--     let @s = temp
--   endfunction
--
--   xnoremap * :<C-u>call g:VSetSearch('/')<cr>/<C-R>=@/<cr><cr>
--   xnoremap # :<C-u>call g:VSetSearch('?')<cr>?<C-R>=@/<cr><cr>
-- ]])
