local cwd = vim.fn.getcwd()

-- Search cwd and its parent for a project.godot file.
local function find_godot_root()
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

local project_root = find_godot_root()

if project_root then
    local pipe_path
    if vim.fn.has("win32") == 1 then
        -- Windows named pipes cannot contain path separators.
        -- Neovim will create \\.\.pipe\<name> from a bare name.
        local name = project_root:gsub("[/\\:]+", "-"):gsub("^%-+", "")
        pipe_path = "godot-" .. name
    else
        pipe_path = project_root .. "/server.pipe"
    end
    -- Only start a new server if one is not already listening on this address.
    local existing = vim.fn.serverlist()
    local already_running = false
    for _, s in ipairs(existing) do
        if s == pipe_path then
            already_running = true
            break
        end
    end
    if not already_running then
        vim.fn.serverstart(pipe_path)
    end
end

