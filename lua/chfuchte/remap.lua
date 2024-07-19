vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard

vim.keymap.set("n", "<leader>rst", "<cmd>LspRestart<cr>") -- restart lsp

vim.keymap.set({"n", "v"}, "p", [["_dP]]) -- paste without overwriting clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard

vim.keymap.set("n", "Q", "<nop>") -- disable ex mode

vim.keymap.set({ "n", "v" }, "<leader>d", "d") -- delete and copy to clipboard
vim.keymap.set({"n", "v"}, "d", [["_d]]) -- delete without overwriting clipboard

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- quickfix list navigation next
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") -- quickfix list navigation prev

vim.keymap.set({"n", "v"}, "r", vim.cmd.redo)-- redo instead of replace
vim.keymap.set("n", "<leader>f", function()
  local pos = vim.api.nvim_win_get_cursor(0)  -- Save the current cursor position
  vim.lsp.buf.format()
  vim.api.nvim_win_set_cursor(0, pos)  -- Restore the cursor position
end)

