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
vim.wo.relativenumber = true
-- for normal mode
vim.api.nvim_set_keymap('n', '<Tab>', 'V>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', 'V<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<S-Tab>', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })
for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<M-%s>", i), function()
        local buf = vim.t.bufs[i]
        if buf and vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_set_current_buf(buf)
        end
    end)
end
