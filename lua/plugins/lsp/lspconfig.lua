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

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})

    -- TODO: do more
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})

    -- Diagnostic keymaps vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" }) vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
    vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

    --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = "", Warning = "", Hint = "💡", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
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

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
    })
  end,
}
