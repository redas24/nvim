vim.keymap.set('n', '<leader>q',  ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>w', ':NvimTreeFocus<CR>')

--Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--FzF keymaps
vim.keymap.set("n", "<c-P>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
--Trouble keymaps
-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leder>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

--Bufferline keymaps
-- Switch to previous buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Switch to next buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Close buffer
vim.api.nvim_set_keymap('n', '<Leader>c', ':BufferLineClose<CR>', { noremap = true, silent = true })

-- Move buffer left
vim.api.nvim_set_keymap('n', '<Leader><Left>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- Move buffer right
vim.api.nvim_set_keymap('n', '<Leader><Right>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

-- Sort buffer by directory structure
vim.api.nvim_set_keymap('n', '<Leader>bd', ':BufferLineSortByDirectory<CR>', { noremap = true, silent = true })

--Glance plugin keymaps
-- Lua
vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

--Keymaps for Copilot github plugin 
vim.keymap.set('n', '<c-C>', '<CMD>Copilot panel<CR>')
