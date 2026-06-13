local ok_mason, mason = pcall(require, "mason")
if not ok_mason then return end

mason.setup({
    ui = {
        border = "rounded",
    },
})

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
    mason_lspconfig.setup({
        ensure_installed = {
            "yamlls",
            "jsonls",
            "marksman",
            "tailwindcss",
            "emmet_ls",
            "cssls",
            "html",
            "eslint",
            "ts_ls",
            "ruff",
            "pyright",
            "omnisharp",
            "clangd",
            "bashls",
            "ast_grep",
            "gleam",
            "lua_ls",
            "rust_analyzer",
        },
        -- LSP clients are enabled explicitly in aoof.config.lsp.
        automatic_enable = false,
    })
end

local ok_tool_installer, tool_installer = pcall(require, "mason-tool-installer")
if ok_tool_installer then
    tool_installer.setup({
        ensure_installed = {
            "stylua",
            "prettier",
            "shfmt",
            "shellcheck",
        },
        run_on_start = true,
        start_delay = 3000,
        debounce_hours = 12,
    })
end
