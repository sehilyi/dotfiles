--
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true

-- spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.list = true

-- the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- text writing
vim.opt.spell = true
vim.opt.spelllang = 'en'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'plasticboy/vim-markdown',
    branch = 'master',
    require = {'godlygeek/tabular'},
  },
  {
        'jakewvincent/mkdnflow.nvim',
        config = function()
            require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            })
        end
  },
  { 'kyazdani42/nvim-web-devicons' },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    end,
  },
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("lazy-lsp").setup {}
    end
  },
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua", "html", "javascript", "typescript"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  'github/copilot.vim',
})
