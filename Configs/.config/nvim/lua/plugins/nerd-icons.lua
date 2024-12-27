return {
	"glepnir/nerdicons.nvim",
	cmd = "NerdIcons",
	config = function()
		require("nerdicons").setup({})
		vim.keymap.set("n", "<leader>i", "<Cmd>NerdIcons<CR>", { desc = "Select nerd icon" })
	end,
}
