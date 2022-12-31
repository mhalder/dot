local M = {
	"williamboman/mason.nvim",
}

M.tools = {
	"ansible-language-server",
	"bash-language-server",
	"black",
	"deno",
	"dockerfile-language-server",
	"flake8",
	"html-lsp",
	"isort",
	"json-lsp",
	"lua-language-server",
	"luacheck",
	"markdownlint",
	"prettierd",
	"revive",
	"pyright",
	"gopls",
	"golangci-lint",
	"gofumpt",
	"goimports",
	"selene",
	"shellcheck",
	"shfmt",
	"stylua",
	"terraform-ls",
	"yaml-language-server",
	"marksman",
	"delve",
	"debugpy",
	"bash-debug-adapter",
	"typescript-language-server",
}

function M.check()
	local mr = require("mason-registry")
	for _, tool in ipairs(M.tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

function M.config()
	require("mason").setup()
	M.check()
	require("mason-lspconfig").setup({
		automatic_installation = true,
	})
end

return M
