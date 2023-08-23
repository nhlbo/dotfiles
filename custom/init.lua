-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.o.autoread = true
vim.cmd[[
  autocmd CursorHold * checktime
]]
vim.api.nvim_set_keymap("v", "<M-c>", '"+y', { noremap = true })
for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<M-%s>", i), function()
      vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end)
end