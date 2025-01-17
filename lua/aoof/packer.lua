-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "samharju/synthweave.nvim",
    as = 'synthweave',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    config = function()
        -- vim.cmd.colorscheme("synthweave")
        -- transparent version
        vim.cmd.colorscheme("synthweave-transparent")
        end
    }

    use { 'nvim-treesitter/nvim-treesitter', as = 'treesitter', { run = ':TSUpdate' } }
    use { 'nvim-treesitter/playground' }
    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'williamboman/mason.nvim'})
    use({'williamboman/mason-lspconfig.nvim'})
    use { 'andweeb/presence.nvim' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'github/copilot.vim' }
end)
