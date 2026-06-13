return {
    -- Shared utility library (required by telescope and harpoon)
    "nvim-lua/plenary.nvim",

    -- Fuzzy finder: files, grep, git files, buffers, help
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("aoof.config.telescope")
        end,
    },

    -- Syntax highlighting and AST parsing
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("aoof.config.treesitter")
        end,
    },

    -- File navigation: bookmark and quick-jump between files
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("aoof.config.harpoon")
        end,
    },

    -- Undo history visualization
    "mbbill/undotree",

    -- Git integration
    "tpope/vim-fugitive",

    -- Discord Rich Presence
    {
        "andweeb/presence.nvim",
        config = function()
            require("aoof.config.presence")
        end,
    },

    -- LSP server configurations and root-dir detection
    -- Servers must be installed on the system PATH (use your OS package
    -- manager, npm, pip, cargo, etc. — Mason is not used).
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("aoof.config.lsp")
        end,
    },

    -- Time tracking
    "wakatime/vim-wakatime",

    -- Panda theme
    {
        "markvincze/panda-vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("panda")
        end,
    },
}
