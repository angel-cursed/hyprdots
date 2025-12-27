return {
	"glepnir/nerdicons.nvim",
	lazy = false,
	config = function()
		require("nerdicons").setup({})
		vim.keymap.set("n", "<leader>ni", "<Cmd>NerdIcons<CR>", { desc = "Select nerd icon" })
	end,
}
