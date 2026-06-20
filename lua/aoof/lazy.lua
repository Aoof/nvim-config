local lazypath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")

if not vim.uv.fs_stat(lazypath) then
    vim.fn.mkdir(vim.fs.dirname(lazypath), "p")

    local repo = "https://github.com/folke/lazy.nvim.git"
    local result = vim.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        repo,
        lazypath,
    }):wait()

    if result.code ~= 0 then
        vim.notify(
            "Failed to clone lazy.nvim:\n" .. (result.stderr or ""),
            vim.log.levels.ERROR
        )
        return
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("aoof.plugins", {
    spec = {
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
    },
    change_detection = {
        notify = false,
    },
})

local root_markers = { '.git', 'Makefile', 'package.json', 'Cargo.toml' }

vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local root = vim.fs.root(0, root_markers)
        if root then
            vim.fn.chdir(root)
        end
    end,
})

