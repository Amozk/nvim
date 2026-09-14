local cmp = require "cmp"
local conf = require "nvchad.configs.cmp"

-- Extend NvChad's default mappings with Windows-friendly triggers
conf.mapping = vim.tbl_deep_extend("force", conf.mapping or {}, {
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-o>"] = cmp.mapping.complete(),
  ["<C-@>"] = cmp.mapping.complete(),
})

return conf
