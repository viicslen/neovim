---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ['gd'] = { ":Telescope lsp_definitions<CR>", "Go to definition" },
    ["<leader>k"] = { ":nohlsearch<CR>", "Quickly clear search highlighting." },
    ["<leader>Q"] = { ":bufdo bdelete<CR>", "Close all open buffers." },
    ["gf"] = { ":edit <cfile><CR>", "Allow gf to open non-existent files." },
    ["q:"] = { ":q<CR>", "Disable annoying command line thing." },
    ["<C-Up>"] = { ":resize +2<CR>", "Resize with arrows." },
    ["<C-Down>"] = { ":resize -2<CR>", "Resize with arrows." },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize with arrows." },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize with arrows." },
    ["<C-q>"] = { ":q<CR>", "Quit current buffer" },
    ["k"] = { "v:count == 0 ? 'gk' : 'k'", "When text is wrapped, move by terminal rows, not lines, unless a count is provided.", opts = { expr = true } },
    ["j"] = { "v:count == 0 ? 'gj' : 'j'", "When text is wrapped, move by terminal rows, not lines, unless a count is provided.", opts = { expr = true } },
  },
  v = {
    ["<"] = { "<gv", "Reselect visual selection after indenting." },
    [">"] = { ">gv", "Reselect visual selection after indenting." },
    ["y"] = { "myy`y", "Maintain the cursor position when yanking a visual selection." },
    ["Y"] = { "myY`y", "Maintain the cursor position when yanking a visual selection." },
    ["p"] = { '"_dP', "Paste replace visual selection without copying it." },
    ["<C-s>"] = { "<Esc>:w<CR>", "Save current buffer" },
    ["<C-q>"] = { "<Esc>:q<CR>", "Quit current buffer" },
  },
  i = {
    [";;"] = { "<Esc>A;<Esc>", "Easy insertion of a trailing ; or , from insert mode." },
    [",,"] = { "<Esc>A,<Esc>", "Easy insertion of a trailing ; or , from insert mode." },
    ["<C-s>"] = { "<Esc>:w<CR>", "Save current buffer" },
  }
}

-- more keybinds!

return M
