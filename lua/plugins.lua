local M = {}

local function install_lazy()
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
end

local function setup_packages()
    require("lazy").setup {
        {
          "folke/which-key.nvim",
          event = "VeryLazy",
          init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
          end,
          opts = {
          }
        },
        {'junegunn/fzf', build=":call fzf#install()"},
        {'nvim-treesitter/nvim-treesitter', build=":TSUpdate"},
        {
          "NeogitOrg/neogit",
          dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
          },
          config = true
        },
        'Olical/conjure',
        'junegunn/fzf.vim',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-tree/nvim-tree.lua',
        'nvim-tree/nvim-web-devicons',
        'janet-lang/janet.vim'
    }
    require("nvim-tree").setup()
    require("whichkey").setup()
end

function M.setup()
    install_lazy()
    setup_packages()
end

return M
