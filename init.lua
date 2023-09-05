vim.cmd.colorscheme("habamax")
vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g.python3_host_prog = "/home/matt/.pyenv/versions/neovim/bin/python"
vim.g.maplocalleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	{'junegunn/fzf', build=":call fzf#install()"},
    {'nvim-treesitter/nvim-treesitter', build=":TSUpdate"},
	'Olical/conjure',
	'junegunn/fzf.vim',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-tree/nvim-tree.lua',
    "nvim-tree/nvim-web-devicons"
}

require("nvim-tree").setup()

function update_opts(opts)
	for k,v in pairs(opts) do
		vim.opt[k] = v
	end
end

update_opts {
	shiftwidth=4,
	tabstop=4,
	expandtab=true
}
