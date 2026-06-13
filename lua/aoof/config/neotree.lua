local ok, neotree = pcall(require, "neo-tree")
if not ok then return end

neotree.setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    window = {
        mappings = {
            ["<space>"] = "none",
        },
    },
})

vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd>Neotree toggle reveal filesystem left<cr>",
    { desc = "Explorer" }
)
