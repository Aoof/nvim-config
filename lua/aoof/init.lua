-- Load order is intentional: options first, then lazy-managed plugins, then
-- general keymaps and non-plugin config.
require("aoof.options")
require("aoof.lazy")
require("aoof.keymaps")

require("aoof.config.statusline")
require("aoof.config.godotserver")

