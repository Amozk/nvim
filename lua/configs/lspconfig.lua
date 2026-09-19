-- require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

local capabilities = nvlsp.capabilities
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init

-- Default config for all language servers
vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
})

-- Custom Config for Astro
vim.lsp.config("astro", {
  before_init = function(_, config)
    local util = require "lspconfig.util"
    local tsdk = util.get_typescript_server_path(config.root_dir)

    if not tsdk or tsdk == "" then
      local mason_ts = vim.fn.stdpath "data" .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
      if vim.fn.filereadable(mason_ts .. "/typescript.js") == 1 then
        tsdk = mason_ts
      end
    end

    config.init_options = config.init_options or {}
    config.init_options.typescript = config.init_options.typescript or {}
    config.init_options.typescript.tsdk = tsdk

    -- Required for Astro auto-imports
    config.init_options.preferences = vim.tbl_deep_extend("force", config.init_options.preferences or {}, {
      includeCompletionsForModuleExports = true,
      includeCompletionsWithInsertText = true,
      importModuleSpecifierPreference = "shortest",
    })
  end,
})

local servers = { "html", "cssls", "astro", "ts_ls", "eslint", "tailwindcss" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
