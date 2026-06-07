-- Native plugin management via vim.pack (Neovim 0.12+).
-- Run :packupdate  to update all plugins (lowercase, all one word).
-- Run :packdel <name> to remove a plugin from disk after removing it here.
if not vim.pack then
    vim.notify(
        "vim.pack not found — upgrade to Neovim 0.12+",
        vim.log.levels.ERROR
    )
    return
end

vim.pack.add({
    -- Shared utility library (required by telescope and harpoon)
    "https://github.com/nvim-lua/plenary.nvim",

    -- Fuzzy finder: files, grep, git files, buffers, help
    "https://github.com/nvim-telescope/telescope.nvim",

    -- Syntax highlighting and AST parsing
    "https://github.com/nvim-treesitter/nvim-treesitter",

    -- File navigation: bookmark and quick-jump between files
    {
        src     = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2",
        name    = "harpoon",
    },

    -- Undo history visualization
    "https://github.com/mbbill/undotree",

    -- Git integration
    "https://github.com/tpope/vim-fugitive",

    -- Discord Rich Presence
    "https://github.com/andweeb/presence.nvim",

    -- LSP server configurations and root-dir detection
    -- Servers must be installed on the system PATH (use your OS package
    -- manager, npm, pip, cargo, etc. — Mason is no longer used).
    "https://github.com/neovim/nvim-lspconfig",

    -- Time tracking
    "https://github.com/wakatime/vim-wakatime",

    -- Gruvbox theme
    "https://github.com/markvincze/panda-vim",
})
