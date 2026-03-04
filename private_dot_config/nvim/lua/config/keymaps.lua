local km = vim.keymap.set

-- km("i", "jk", "<ESC>", { desc = "Escape Insert", noremap = true, silent = true })
-- Save file with Ctrl+S
km("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file", noremap = true, silent = true })
-- Horizontal split with <leader>s
km("n", "<leader>s", "<cmd>split<cr>", { desc = "Horizontal split", noremap = true, silent = true })
-- Vertical split with <leader>v
km("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical split", noremap = true, silent = true })
-- Clear highlights on searckh when pressing <Esc> in normal mode
km("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
km("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
km("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--  Use CTRL+<hjkl> to switch between windows
km("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
km("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
km("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })

km("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

km("n", "<leader>ag", function()
  local current = vim.lsp.inline_completion.is_enabled()
  vim.lsp.inline_completion.enable(not current)
  vim.notify(current and "Copilot ghost text disabled" or "Copilot ghost text enabled", vim.log.levels.INFO)
end, { desc = "Toggle Copilot suggestions" })
km("i", "<C-S-y>", function()
  if vim.lsp.inline_completion.is_visible() then
    return vim.lsp.inline_completion.accept()
  else
    return "<C-S-y>"
  end
end, { expr = true, desc = "Accept Copilot suggestion" })

-- vim: ts=2 sts=2 sw=2 et
