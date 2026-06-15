local ok, config = pcall(require, "nvim-treesitter.config")
if not ok then return end;

config.setup({
    install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/site"),
    ensure_installed = {
        "svelte", "javascript", "typescript", "tsx",
        "c", "cpp",
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "python",
        "rust",
        "json", "yaml", "toml",
        "html", "css",
        "bash",
    },

    -- Install parsers synchronously only on explicit :TSInstall
    sync_install = false,
    -- Auto-install missing parsers when opening a buffer
    auto_install  = true,

    highlight = {
        enable                            = true,
        additional_vim_regex_highlighting = false,
    },

    -- Treesitter-based indentation (replaces smartindent for supported langs)
    indent = { enable = true },
})
