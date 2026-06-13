local ok, todo = pcall(require, "todo-comments")
if not ok then return end

todo.setup({
    signs = true,
})

vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Todo list" })
vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
