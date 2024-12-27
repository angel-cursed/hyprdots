return {
	"Zeioth/compiler.nvim",
	lazy = false,
	dependencies = {
		{
			"stevearc/overseer.nvim",
			opts = {
				task_list = {
					direction = "bottom",
					min_height = 25,
					max_height = 25,
					default_detail = 1,
				},
			},
		},
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("compiler").setup()

		vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", {
			desc = "Open compiler",
		})
		vim.api.nvim_set_keymap("n", "<leader>cs", "<cmd>CompilerStop<cr>", {
			desc = "Stop compiler",
		})

		vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", {
			desc = "Toggle compiler results",
		})
	end,
}
