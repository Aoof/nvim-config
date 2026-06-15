return {
    -- Shared utility library (required by telescope, harpoon, and other plugins)
    "nvim-lua/plenary.nvim",

    -- File and plugin icons
    "nvim-tree/nvim-web-devicons",

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
        lazy = false,
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

    -- Git signs and hunk actions
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("aoof.config.gitsigns")
        end,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        priority = 1000,
        config = function()
            require("aoof.config.neotree")
        end,
    },

    -- Keymap discovery
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("aoof.config.which-key")
        end,
    },

    -- Diagnostics, symbols, references, quickfix, and location lists
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("aoof.config.trouble")
        end,
    },

    -- Highlight and search TODO/FIX/HACK/NOTE comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("aoof.config.todo-comments")
        end,
    },

    -- Discord Rich Presence
    {
        "andweeb/presence.nvim",
        config = function()
            require("aoof.config.presence")
        end,
    },

    -- Mason installs supported servers/tools; unsupported custom servers can
    -- still be installed externally on PATH.
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("aoof.config.mason")
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },

    -- LSP server configurations and root-dir detection
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("aoof.config.lsp")
        end,
    },

    -- Time tracking
    "wakatime/vim-wakatime",

    -- Utilities
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = { }
    },

    -- Theme
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("cyberdream")
        end,
    },
}
