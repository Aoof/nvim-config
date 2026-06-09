local GODOT_PORT = 6004

-- Search cwd and its parent for a project.godot file.
local function find_godot_root()
    local cwd = vim.fn.getcwd()
    local candidates = {
        cwd,
        vim.fn.fnamemodify(cwd, ":h"),
    }
    for _, path in ipairs(candidates) do
        if vim.uv.fs_stat(path .. "/project.godot") then
            return path
        end
    end
end

local function start_godot_server(port)
    port = port or GODOT_PORT
    local addr = "127.0.0.1:" .. port
    -- Only start a new server if one is not already listening on this address.
    local existing = vim.fn.serverlist()
    for _, s in ipairs(existing) do
        if s == addr then
            vim.notify("Godot server already running on " .. addr, vim.log.levels.INFO)
            return
        end
    end
    vim.fn.serverstart(addr)
    vim.notify("Godot server started on " .. addr, vim.log.levels.INFO)
end

-- Auto-start when inside a Godot project.
if find_godot_root() then
    start_godot_server()
end

-- Keybind to manually start the server (<leader>gs).
vim.keymap.set("n", "<leader>gs", function()
    start_godot_server()
end, { desc = "Start Godot LSP server on port " .. GODOT_PORT })

