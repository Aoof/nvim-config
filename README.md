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

This config uses native LSP with `nvim-lspconfig`, but it does not install language servers automatically. Install the servers you use with your OS package manager or language tooling.

Examples:

- `lua_ls` for Lua
- `ts_ls` and `eslint` for TypeScript/JavaScript
- `pyright` and `ruff` for Python
- `rust_analyzer` for Rust
- `clangd` for C/C++
- `gdscript` requires Godot running with the project open

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
:checkhealth
```
