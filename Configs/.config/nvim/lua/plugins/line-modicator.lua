return {
	"mawkler/modicator.nvim",
	dependencies = {
		"catppuccin/nvim",
		"EdenEast/nightfox.nvim",
		"sainnhe/gruvbox-material",
		"rose-pine/neovim",
		"rebelot/kanagawa.nvim",
		"folke/tokyonight.nvim",
		"LunarVim/synthwave84.nvim",
		"neanias/everforest-nvim",
		"Shatur/neovim-ayu",
		"rmehri01/onenord.nvim",
		{ "LazyVim/LazyVim", opts = {
			colorscheme = "rose-pine-main",
		} },
	},
	config = function()
		require("modicator").setup({
			integration = {
				lualine = {
					enabled = false,
				},
			},
		})
	end,
}
