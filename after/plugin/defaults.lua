--vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.maplocalleader = " "
vim.g.mapleader = " "

vim.cmd.colorscheme("habamax")
vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g.python3_host_prog = "/home/matt/.pyenv/versions/neovim/bin/python"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function update_opts(opts)
	for k,v in pairs(opts) do
		vim.opt[k] = v
	end
end

update_opts {
	shiftwidth=4,
	tabstop=4,
	expandtab=true,
    number=true,
    clipboard="unnamedplus",
    timeoutlen=300
}
