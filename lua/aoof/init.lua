-- Load order is intentional: options first, then plugins, then per-plugin
-- config (all plugins are loaded by vim.pack.add before these run), then keymaps.
require("aoof.options")
require("aoof.plugins")

require("aoof.config.telescope")
require("aoof.config.treesitter")
require("aoof.config.harpoon")
require("aoof.config.presence")
require("aoof.config.statusline")
require("aoof.config.lsp")  -- last: needs lspconfig + attach hooks registered

require("aoof.keymaps")

