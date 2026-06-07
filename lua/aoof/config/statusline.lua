-- Native statusline with Nerd Font icons — no plugins required.
-- All icons use explicit \u{XXXX} escapes (Nerd Fonts v2 BMP range U+E000–U+F8FF)
-- so the code points are visible, portable, and not silently corrupted by editors.

local mode_icons = {
    n       = "\u{E7C5} NORMAL",   -- nf-dev-vim
    i       = "\u{F040} INSERT",   -- nf-fa-pencil
    v       = "\u{F0C4} VISUAL",   -- nf-fa-scissors (selection)
    V       = "\u{F0C4} V-LINE",
    ["\22"] = "\u{F0C4} V-BLOCK",  -- <C-v>
    c       = "\u{F120} COMMAND",  -- nf-fa-terminal
    s       = "\u{F065} SELECT",   -- nf-fa-expand
    S       = "\u{F065} S-LINE",
    ["\19"] = "\u{F065} S-BLOCK",  -- <C-s>
    R       = "\u{F021} REPLACE",  -- nf-fa-refresh
    t       = "\u{F489} TERMINAL", -- nf-fa-terminal (alt)
}

local filetype_icons = {
    lua        = "\u{E620}",  -- nf-seti-lua
    python     = "\u{E606}",  -- nf-dev-python
    javascript = "\u{E60C}",  -- nf-dev-javascript
    typescript = "\u{E628}",  -- nf-dev-typescript
    tsx        = "\u{E628}",
    jsx        = "\u{E60C}",
    rust       = "\u{E7A8}",  -- nf-dev-rust
    go         = "\u{E626}",  -- nf-dev-go
    c          = "\u{E61E}",  -- nf-dev-c
    cpp        = "\u{E61D}",  -- nf-dev-cplusplus
    cs         = "\u{F81A}",  -- nf-md-language_csharp (v2 compat)
    html       = "\u{E60E}",  -- nf-dev-html5
    css        = "\u{E60D}",  -- nf-dev-css3
    scss       = "\u{E60D}",
    json       = "\u{E60B}",  -- nf-dev-code_badge
    yaml       = "\u{E6A8}",  -- nf-seti-yml
    toml       = "\u{E6B2}",  -- nf-seti-config
    markdown   = "\u{E609}",  -- nf-dev-markdown
    sh         = "\u{F489}",  -- nf-oct-terminal
    bash       = "\u{F489}",
    vim        = "\u{E62B}",  -- nf-dev-vim (classic)
    git        = "\u{E702}",  -- nf-dev-git
    gitcommit  = "\u{E702}",
}

local function mode_label()
    local m = vim.api.nvim_get_mode().mode
    return mode_icons[m] or ("\u{F128} " .. m)  -- nf-fa-question fallback
end

local function ft_label()
    local ft = vim.bo.filetype
    local icon = filetype_icons[ft]
    if icon then
        return icon .. " " .. ft
    elseif ft ~= "" then
        return "\u{F15C} " .. ft  -- nf-fa-file-text fallback
    end
    return ""
end

local function flags()
    local f = ""
    if vim.bo.modified then f = f .. " \u{25CF}" end               -- ● bullet
    if vim.bo.readonly or not vim.bo.modifiable then f = f .. " \u{F023}" end  -- nf-fa-lock
    return f
end

local function lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return "" end
    local names = vim.tbl_map(function(c) return c.name end, clients)
    return "\u{F0E7} " .. table.concat(names, " ")  -- nf-fa-bolt
end

function _G.Statusline()
    return table.concat({
        " ", mode_label(), " ",
        " \u{F15C} %f",      -- nf-fa-file-text + relative path
        flags(),
        "%=",                -- right-align from here
        lsp_clients(), "  ",
        ft_label(), "  ",
        "\u{F0C9} %3l:%-2c  ",   -- nf-fa-bars + line:col
        "\u{F124} %3p%%  ",       -- nf-fa-location-arrow + scroll %
    })
end

vim.opt.statusline = "%!v:lua.Statusline()"

