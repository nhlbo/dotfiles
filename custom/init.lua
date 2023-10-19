-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.o.autoread = true
vim.cmd([[
  autocmd CursorHold * checktime
]])
vim.wo.relativenumber = true
vim.api.nvim_set_keymap("v", "<c-c>", "y", { silent = true })
vim.api.nvim_set_keymap("n", "<bs>", "hx", { silent = true })
vim.api.nvim_set_keymap("v", "<bs>", '"_d', { silent = true })
vim.api.nvim_set_keymap("n", "<c-s>", ":w<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<s-tab>", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<s-tab>", "<c-d>", { noremap = true, silent = true })
for i = 1, 9, 1 do
	vim.keymap.set("n", string.format("<c-t>%s", i), function()
		local buf = vim.t.bufs[i]
		if buf and vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_set_current_buf(buf)
		end
	end)
end
