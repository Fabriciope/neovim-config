-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- move lines --
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

-- barbar
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Tab>h", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<Tab>l", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
--vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
--vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
vim.keymap.set("n", "<Tab>1", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<Tab>2", "<Cmd>BufferGoto 2<CR>", opts)
--vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
--vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
--vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
--vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
--vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)

--vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
--vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- Move to previous/next
--vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
--vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
vim.keymap.set("n", "<Tab>d", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- Sort automatically by...
--vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
--vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
--vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
--vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
--vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
--vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- NOTE: LSP keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
vim.keymap.set({ "n", "v" }, "<space>ca", function()
  vim.lsp.buf.code_action({ apply = true })
end, {})

vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
