return {
	"krivahtoo/silicon.nvim",

	run = "./install.sh",

	config = function()
		require("silicon").setup({
			background = "#87f",
			theme = "Monokai Extended",
			line_number = true,
			pad_vert = 80,
			pad_horiz = 50,
			output = {
				format = "code.png",
				clipboard = false,
				path = "",
			},
			watermark = {
				text = "angel-cursed",
			},
			window_title = function()
				return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
			end,
		})

		vim.keymap.set("n", "<leader>sc", "<Cmd>:Silicon<CR>", { desc = "Create image from code" })
	end,
}
