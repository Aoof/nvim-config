local ok, gitsigns = pcall(require, "gitsigns")
if not ok then return end

gitsigns.setup({
    signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
        untracked    = { text = "?" },
    },
    current_line_blame = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(gs.next_hunk)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Next git hunk" })

        vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(gs.prev_hunk)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Previous git hunk" })

        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
        vim.keymap.set("n", "<leader>gb", gs.blame_line, vim.tbl_extend("force", opts, { desc = "Blame line" }))
        vim.keymap.set("n", "<leader>gs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
        vim.keymap.set("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, vim.tbl_extend("force", opts, { desc = "Stage selection" }))
        vim.keymap.set("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, vim.tbl_extend("force", opts, { desc = "Reset selection" }))
    end,
})
