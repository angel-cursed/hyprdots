return {
	"romgrk/barbar.nvim",

	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local map = vim.keymap.set

		map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
		map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
		map("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
		map("n", "<leader>bs", "<Cmd>w<CR>", { desc = "Save buffer" })
	end,
}
