local parsers = {
    "svelte", "javascript", "typescript", "tsx",
    "c", "cpp",
    "lua", "vim", "vimdoc", "query",
    "markdown", "markdown_inline",
    "python",
    "rust",
    "json", "yaml", "toml",
    "html", "css",
    "bash",
}

local ts = require("nvim-treesitter")

-- Parser installation directory
ts.setup({
    install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
})

-- Install all configured parsers asynchronously.
ts.install(parsers)

-- Enable Treesitter features for supported filetypes.
vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function(ev)
        -- Syntax highlighting
        vim.treesitter.start(ev.buf)

        -- Treesitter indentation
        vim.bo[ev.buf].indentexpr =
        "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
