vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-q>', '<C-w><C-q>', { desc = 'Close window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

require 'core.snippets'
vim.keymap.set('n', '<A-t>', function()
	TermToggle(60)
	TermToggle(60)
end, { noremap = true, silent = true })
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><cmd>lua TermToggle(60)<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>td', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- nvim-dap-python keymaps
vim.keymap.set('n', '<leader>dc', function()
	require('dap').continue()
end)
vim.keymap.set('n', '<leader>ds', function()
	require('dap').step_over()
end)
vim.keymap.set('n', '<leader>di', function()
	require('dap').step_into()
end)
vim.keymap.set('n', '<leader>do', function()
	require('dap').step_out()
end)
vim.keymap.set('n', '<leader>b', function()
	require('dap').toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>B', function()
	require('dap').set_breakpoint()
end)

vim.keymap.set('n', '<leader>R', function()
	local dap = require 'dap'
	dap.run {
		type = 'python',
		request = 'launch',
		name = 'Launch file', -- must exist to avoid nil error
		program = '${file}',
		console = 'integratedTerminal',
		cwd = vim.fn.expand '~/apps/tensor-atelier/src',
	}
end, { desc = 'Debug Python File' })

-- neorg
vim.keymap.set('n', '<leader>d', '<cmd>Neorg workspace dev<CR>')
