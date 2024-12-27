return {
	"AntonVanAssche/music-controls.nvim",

	opts = {
		default_player = "spotify",
	},

	config = function()
		vim.keymap.set("n", "<leader>mp", "<Cmd>MPlay spotify<CR>", { desc = "Play or Pause music from spotify" })
		vim.keymap.set("n", "<leader>mn", "<Cmd>MNext<CR>", { desc = "Play next music" })
		vim.keymap.set("n", "<leader>mc", "<Cmd>MCurrent<CR>", { desc = "Show current music" })
		vim.keymap.set("n", "<leader>mb", "<Cmd>MPrev<CR>", { desc = "Play previous music" })
		vim.keymap.set("n", "<leader>ms", "<Cmd>MShuffle<CR>", { desc = "Toggle shuffle mode" })
		vim.keymap.set("n", "<leader>ml", "<Cmd>MLoopToggle<CR>", { desc = "Toggle loop mode" })
	end,
}
