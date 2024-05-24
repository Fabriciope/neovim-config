return {
  {
    "rebelot/kanagawa.nvim",
    --lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true, bold = false },
        functionStyle = { bold = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { bold = true },
        typeStyle = { bold = false },
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {
            sumiInk3 = "#17171f", -- bg main
            --   sumiInk4 = "#141414",    -- barra dos numeros laterais
            --sumiInk4 = "none", -- barra dos numeros laterais
            --   sumiInk5 = "#1a1a21",    -- hover ao navegar pelos arquivos
            sumiInk5 = "#18181c", -- hover ao navegar pelos arquivos
            --   oldWhite = "#DCD7BA",    -- :
            --   fujiWhite = "#edead8",   -- variaveis
            fujiWhite = "#dedbce", -- variaveis
            --   fujiGray = "#727169",    -- comentario
            --   oniViolet = "#9880bf",   -- default purple
            --   oniViolet2 = "#c2bce6",  -- parameters
            --   crystalBlue = "#789ade", -- azul funcao e pastas
            --crystalBlue = "#859bc7", -- azul funcao e pastas
            --   springBlue = "#79b7d1",  -- chamadas de funcoes
            --   springGreen = "#f5a43b", -- strings  "something"
            --   boatYellow2 = "#e8c990", -- indicativo de ponteiro e igual
          },
          theme = {
            -- change specific usages for a certain theme, or for all of them
            all = {
              ui = {
                float = {
                  --      bg = "none",
                },
                --   bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })

      --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      --vim.cmd("colorscheme rose-pine-main")
    end,
  },
  {

    "elianiva/icy.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    opts = {},
    config = function()
      --  vim.cmd("colorscheme icy")
    end,
  },
}
