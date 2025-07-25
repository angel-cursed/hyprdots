return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({ capabilities = capabilities })
				end,
			})

			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Display hover informations" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Show code definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename all references" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Explain code error" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
}
