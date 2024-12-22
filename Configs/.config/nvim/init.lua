local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
require("lazy").setup("plugins")

require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

local parsers = require("nvim-treesitter.parsers")
function _G.ensure_treesitter_language_installed()
	local lang = parsers.get_buf_lang()
	if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
		vim.schedule_wrap(function()
			vim.cmd("TSInstallSync " .. lang)
			vim.cmd([[e!]])
		end)()
	end
end

vim.cmd([[autocmd FileType * :lua ensure_treesitter_language_installed()]])

