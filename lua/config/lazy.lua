local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  require("plugins.neo-tree"),
  require("plugins.telescope"),
  require("plugins.gitsigns"),
  require("plugins.autopairs"),
  require("plugins.colorscheme"),
  require("plugins.treesitter"),
  require("plugins.dressing"),
  require("plugins.todo-comments"),
  require("plugins.indent-blankline"),
  require("plugins.lualine"),
  -- TODO: add numToStr/Comment.nvim

  require("plugins.lsp.mason"),
  require("plugins.lsp.lspconfig"),
  require("plugins.completions"),

  require("plugins.formatting"),
  require("plugins.linting"),
})