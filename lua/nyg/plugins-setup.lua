local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  --themes
  use 'folke/tokyonight.nvim'
  use 'oxfist/night-owl.nvim'
  use 'joshdick/onedark.vim'
  
  --pane movement plugin
  use 'christoomey/vim-tmux-navigator'

  --autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'vim-airline/vim-airline'
  

  -- lsp -> language server protocols
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "glepnir/lspsaga.nvim", branch = "main", -- for window like vscode
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim"
  }


  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.4',
      requires = {{'nvim-lua/plenary.nvim'}}
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
