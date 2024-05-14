return {
  "stevearc/conform.nvim",
  even = { "BufReadPre", "BufNewFilw" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        yaml = { "yamlfmt", "prettier" },

        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        php = { "php_cs_fixer" },
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<tab>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "formatting file" })
  end,
}
