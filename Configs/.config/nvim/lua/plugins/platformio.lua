return {
	"anurag3301/nvim-platformio.lua",
	-- cmd = { 'Pioinit', 'Piorun', 'Piocmdh', 'Piocmdf', 'Piolib', 'Piomon', 'Piodebug', 'Piodb' },

	-- dependencies are always lazy-loaded unless specified otherwise

	dependencies = {
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{
			-- WhichKey helps you remember your Neovim keymaps,
			-- by showing available keybindings in a popup as you type.
			"folke/which-key.nvim",
			opts = {
				preset = "helix", --'modern', --"classic", --
				sort = { "order", "group", "manual", "mod" },
			},
		},
	},

	config = function()
		require("platformio").setup({
			lsp = "clangd",
			autoscroll = true,
		})

		vim.keymap.set("n", "<leader>ioi", ":Pioinit<CR>", { desc = "Creates a new Platformio project" })
		vim.keymap.set("n", "<leader>ior", ":Piorun<CR>", { desc = "Compile and flash the code on the board" })
		vim.keymap.set("n", "<leader>ios", ":Piomon<CR>", { desc = "Launch serial monitor" })
		vim.keymap.set("n", "<leader>iol", ":Piolib<CR>", { desc = "Lets you manage and install librairies" })
	end,
}
