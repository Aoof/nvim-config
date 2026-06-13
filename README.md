# Neovim Configuration

Personal Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Requirements

- Neovim 0.10 or newer
- Git available on your `PATH`
- A Nerd Font-compatible terminal font for statusline icons
- A C compiler for Treesitter parser builds

## Install

Clone or copy this config into Neovim's config directory:

- Windows: `%LOCALAPPDATA%\nvim`
- macOS/Linux: `~/.config/nvim`

Start Neovim once. The config bootstraps `lazy.nvim` automatically and installs plugins into Neovim's data directory.

To manually sync plugins, run:

```vim
:Lazy sync
```

Or from a shell:

```sh
nvim --headless "+Lazy! sync" +qa
```

## Language Servers

This config uses native LSP with `nvim-lspconfig` and keeps Neovim's native completion. Supported language servers and common tools are installed through Mason; unsupported or custom servers can still be installed with your OS package manager or language tooling.

Examples:

- `lua_ls` for Lua
- `ts_ls` and `eslint` for TypeScript/JavaScript
- `pyright` and `ruff` for Python
- `rust_analyzer` for Rust
- `clangd` for C/C++
- `gdscript` requires Godot running with the project open

Open Mason with:

```vim
:Mason
```

Mason-managed tools include common format/lint helpers such as `stylua`, `prettier`, `shfmt`, and `shellcheck`.

## Included QoL Plugins

- Neo-tree for file browsing (`<leader>e`)
- which-key for leader-key discovery
- gitsigns for inline Git changes and hunk actions
- Trouble for diagnostics, symbols, references, quickfix, and location lists
- todo-comments for TODO/FIX/HACK/NOTE highlighting and search

## Platform Notes

The config is intended to work on Windows, macOS, and Linux.

- Paths use Neovim's `stdpath()` APIs.
- Windows terminals open PowerShell by default.
- Unix-only keymaps such as `chmod +x` and `tmux` are guarded.
- Plugin sync still requires internet access and Git on each machine.

## Useful Commands

```vim
:Lazy
:Lazy sync
:Lazy update
:Mason
:MasonToolsInstall
:checkhealth
```
