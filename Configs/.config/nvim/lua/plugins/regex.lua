return {
	"tomiis4/Hypersonic.nvim",
	event = "CmdlineEnter",
	cmd = "Hypersonic",
	config = function()
		require("hypersonic").setup()
		vim.keymap.set("n", "<leader>h", ":Hypersonic")
		vim.keymap.set("v", "<leader>h", ":Hypersonic<CR>")
	end,
}
