return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    --		"hrsh7th/cmp-nvim-lua",
    -- allows rename file throught nvim trees (i think)
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = "", Warning = "", Hint = "💡", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      filetypes = { "html", "blade" },
      files = {
        associations = { "*.html", "*.blade.php" }, -- Associating .blade.php files as well
        maxSize = 5000000,
      },
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lspconfig["gopls"].setup({
      capabilities = capabilities,
    })

    lspconfig["sqlls"].setup({
      capabilities = capabilities,
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
    })

    lspconfig["intelephense"].setup({
      capabilities = capabilities,
      filetypes = { "php", "blade" },
      files = {
        associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
        maxSize = 5000000,
      },
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      filetypes = { "html", "php", "blade" },
    })
  end,
}
