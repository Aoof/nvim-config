-- Diagnostics: sensible defaults with rounded float borders
vim.diagnostic.config({
    virtual_text     = true,
    signs            = true,
    underline        = true,
    update_in_insert = false,
    severity_sort    = true,
    float            = { border = "rounded", source = true },
})

-- Advertise snippet support to all servers globally.
-- vim.lsp.config('*', ...) merges into every server's config.
vim.lsp.config("*", {
    capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        {
            textDocument = {
                completion = {
                    completionItem = { snippetSupport = true },
                },
            },
        }
    ),
})

-- On attach: enable native completion and inlay hints.
-- Neovim 0.11+ already provides default keymaps for:
--   K(hover), gd(def), gD(decl), gr/grr(refs), grn(rename), gra(code action)
--   gri(impl), gO(doc symbols), <C-s>(sig help in insert)
-- Only map extras that are not covered by defaults.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("aoof.lsp", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then return end

        -- Native completion with auto-trigger (replaces nvim-cmp)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Inlay hints
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end

        -- Extra keymaps not covered by Neovim defaults
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "x" }, "<F3>", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
    end,
})

-- Lua: Neovim-aware settings so vim globals are not flagged as unknown.
-- This extends the default lua_ls config provided by nvim-lspconfig.
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime    = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace  = {
                library         = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})

-- GDScript: connect to Godot's built-in LSP server over TCP.
-- The default lspconfig cmd uses `nc` (netcat) which is unavailable on Windows.
-- Godot must be running with the project open for this to work.
vim.lsp.config("gdscript", {
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
    filetypes = { "gd", "gdscript", "gdscript3" },
    root_dir = function(bufnr)
        return vim.fs.root(bufnr, "project.godot")
    end,
})

-- Language servers.
-- nvim-lspconfig provides the default cmd/filetypes/root_dir for each.
-- Mason installs supported servers and adds them to PATH; custom or
-- unsupported servers can still be installed with external tooling.
vim.lsp.enable({
    "vuels",          -- Vue
    "yamlls",         -- YAML
    "jsonls",         -- JSON
    "marksman",       -- Markdown
    "tailwindcss",    -- Tailwind CSS
    "cssls",          -- CSS / SCSS / LESS
    "html",           -- HTML
    "eslint",         -- ESLint
    "ts_ls",          -- TypeScript / JavaScript
    "ruff",           -- Python (linter + formatter)
    "pyright",        -- Python (type checker)
    "omnisharp",      -- C#
    "clangd",         -- C / C++
    "bashls",         -- Bash
    "ast_grep",       -- Multi-language structural search/rewrite
    "lua_ls",         -- Lua
    "rust_analyzer",  -- Rust
    "gdscript",
})
