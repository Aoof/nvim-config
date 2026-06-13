local ok, wk = pcall(require, "which-key")
if not ok then return end

wk.setup({
    preset = "classic",
    delay = 200,
})

wk.add({
    { "<leader>b", group = "buffers" },
    { "<leader>c", group = "code" },
    { "<leader>e", desc = "Explorer" },
    { "<leader>f", desc = "Format buffer" },
    { "<leader>g", group = "git" },
    { "<leader>m", group = "misc" },
    { "<leader>p", group = "project" },
    { "<leader>s", desc = "Substitute word" },
    { "<leader>t", group = "tabs / terminal" },
    { "<leader>u", desc = "Undo tree" },
    { "<leader>v", group = "config" },
    { "<leader>w", group = "windows" },
    { "<leader>x", group = "diagnostics" },
    { "<leader>y", group = "yank" },
    { "<leader>z", group = "lsp" },
    { "<leader><leader>", desc = "Source current file" },
})
