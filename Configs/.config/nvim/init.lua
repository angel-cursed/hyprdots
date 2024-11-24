vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

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

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { term_color = true, dim_inactive = { enabled = true } } },
    { "EdenEast/nightfox.nvim" },
    { "sainnhe/gruvbox-material" },
    { "rose-pine/neovim", name = "rose-pine" },
    { "rebelot/kanagawa.nvim", name = "kanagawa" },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts= {} },
    { "LunarVim/synthwave84.nvim", name = "synthwave" },
    { "neanias/everforest-nvim" },
    { "Shatur/neovim-ayu" },
    { "rmehri01/onenord.nvim" },
    {
    
        "LazyVim/LazyVim",
        opts = {
			colorscheme = "rose-pine-main",
        },

    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript", "python", "rust", "java", "gdscript", "html", "css", "c", "cpp"},
    highlight = { enable = true },
    indent = { enable = true }
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
