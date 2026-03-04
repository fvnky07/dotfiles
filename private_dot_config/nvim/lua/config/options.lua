vim.o.autoread = true

vim.opt.swapfile = false
-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true
vim.opt.smartindent = true

-- Tab width settings
vim.opt.tabstop = 2 -- Number of spaces a <Tab> displays as
vim.opt.shiftwidth = 2 -- Number of spaces to use for autoindent
vim.opt.softtabstop = 2 -- Number of spaces when pressing <Tab> in insert mode
vim.opt.expandtab = true -- Use spaces instead of actual tab characters

-- Line wrapping
vim.opt.wrap = false -- Enable line wrapping
vim.opt.linebreak = true -- Break lines at word boundaries

-- Break indent
vim.opt.breakindent = true -- Wrapped lines preserve indent
-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.incsearch = true -- Show search matches as you type
vim.opt.hlsearch = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

vim.opt.termguicolors = true -- Enable true color support

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.fillchars:append({ eob = " " })

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 99

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et
