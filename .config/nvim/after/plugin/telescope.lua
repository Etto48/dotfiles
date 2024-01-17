require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true
		}
	}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fc', builtin.live_grep, {})


