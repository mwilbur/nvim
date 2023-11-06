local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

keymap("n","<M-k>",":bprevious<CR>",default_opts)
keymap("n","<M-j>",":bnext<CR>",default_opts)

