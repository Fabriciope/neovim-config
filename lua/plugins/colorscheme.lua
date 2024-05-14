return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        --transparent = true,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        colors = { -- add/modify theme and palette colors
          palette = {
            --   sumiInk3 = "#0d0d0d",    -- bg main
            --   sumiInk4 = "#141414",    -- barra dos numeros laterais
            --   sumiInk5 = "#1a1a21",    -- hover ao navegar pelos arquivos
            --   oldWhite = "#DCD7BA",    -- :
            --   fujiWhite = "#edead8",   -- variaveis
            --   fujiGray = "#727169",    -- comentario
            --   oniViolet = "#9880bf",   -- default purple
            --   oniViolet2 = "#c2bce6",  -- parameters
            --   crystalBlue = "#789ade", -- azul funcao e pastas
            --   springBlue = "#79b7d1",  -- chamadas de funcoes
            --   springGreen = "#f5a43b", -- strings  "something"
            --   boatYellow2 = "#e8c990", -- indicativo de ponteiro e igual
          },
        },
      })
      vim.cmd.colorscheme("kanagawa")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      --	vim.cmd("colorscheme rose-pine")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
