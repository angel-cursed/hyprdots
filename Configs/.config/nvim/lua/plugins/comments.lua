return {
	{
		"numToStr/Comment.nvim",
	},
	{
		"LudoPinelli/comment-box.nvim",
		config = function()
			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }

			-- Titles
			keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)
			-- Named parts
			keymap({ "n", "v" }, "<Leader>cp", "<Cmd>CBllline<CR>", opts)
			-- Simple line
			keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
			-- Marked comments
			keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)
			-- Remove Boxes
			keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)
		end,
	},
}
