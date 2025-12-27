-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cc", "<cmd>CccPick<cr>", { desc = "Open ColorPicker" })

vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", {
  desc = "Open compiler",
})
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CompilerStop<cr>", {
  desc = "Stop compiler",
})
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", {
  desc = "Toggle compiler results",
})

vim.keymap.set("n", "<leader>ioi", ":Pioinit<CR>", { desc = "Creates a new Platformio project" })
vim.keymap.set("n", "<leader>ior", ":Piorun<CR>", { desc = "Compile and flash the code on the board" })
vim.keymap.set("n", "<leader>ios", ":Piomon<CR>", { desc = "Launch serial monitor" })
vim.keymap.set("n", "<leader>iol", ":Piolib<CR>", { desc = "Lets you manage and install librairies" })

vim.keymap.set("n", "<leader>h", ":Hypersonic", { desc = "Open RegEx explainer" })
vim.keymap.set("v", "<leader>h", ":Hypersonic<CR>", { desc = "Open RegEx explainer" })

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Window right" })
