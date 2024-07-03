return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of server for mason to install
      ensure_installed = {
        "gopls",
        "intelephense",
        "tsserver",

        "docker_compose_language_service",
        "dockerls",
        "yamlls",
        "jsonls",
        "bashls",
        "sqlls",

        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
      },

      -- aoto-install configured servers (with lspconfig)
      automatic_installation = true, -- not he same as ensure_installed
    })

    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup({
      ensure_installed = {
        -- TODO: add linters and formatters
      },
    })
  end,
}
