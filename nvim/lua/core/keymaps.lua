-- keympas.lua
-- Defines custom key mappings to improve workflow and overrite defaults.
-- Servers as the central place or all Neovim keybindings.

-- Example: vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
--
-- vim.keymap.set(mode, lhs, rhs, opts)
-- mode: mode(s) like "n" (normal), "v" (visual), or {"n", "v"}
-- lhs: keys you press (left-hand side)
-- rhs: action or command run (right-hand side)
-- opts: optional table with options like { silent = true }
--
-- In rhs:
-- <cmd> starts a command (like typing :)
-- <CR> is Enter, runs the command (Carriage Return)
-- So "<cmd>CommandName<CR>" runs ":CommandName" safely in a mapping

-- Set leader key to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the default behavior of the spacebar in normal and visual modes.
-- This is commonly done to safely use <space> as the leader key for custom shortcuts.
-- Note that <nop> stands for: no operation
vim.keymap.set({ "n", "v" }, "<space>", "<nop>", { silent = true })

-- for conciseness, we declare a variable containing a table with the options
local opts = { noremap = true, silent = true }
-- in normal mode, save file with Ctrl+s
vim.keymap.set("n", "<c-s>", "<cmd>w<CR>", opts)

-- save file without triggering autocommands (e.g., format-on-save)
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <cr>", opts)

-- Scroll to next paragraph and center the cursor line
-- '{' jumps to the beginning of the previous paragraph; 'zz' recenters the line
vim.keymap.set("n", "{", "{zz", opts)

-- Scroll to next paragraph and center the cursor line
-- '}' jumps to the beginning of the next paragraph; 'zz' recenters the line
vim.keymap.set("n", "}", "}zz", opts)

-- Jump to the next search result, center it, and unfold any folds hiding it
-- 'n' moves to the next match; 'zz' centers the line;
vim.keymap.set("n", "n", "nzz", opts)

-- Same as above, but for the previous search result
-- 'N' goes to the previous match; 'zz' recenters;
vim.keymap.set("n", "N", "Nzz", opts)

-- Resize split windows with arrow keys:
vim.keymap.set("n", "<up>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<down>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<right>", "<cmd>vertical resize +2<CR>", opts)

-- Buffer navigation keymaps:
-- <Tab>        : Switch to the next buffer (useful for quickly toggling between files)
-- <Shift-Tab>  : Switch to the previous buffer
-- <leader>x: Close the current buffer forcefully without saving changes
-- <leader>b: Open a new empty buffer

-- Note:
-- Neotree and other special buffers are usually excluded from this cycling
-- because they are not typical file buffers.
--
-- Even though Telescope provides a powerful fuzzy finder for buffers and files,
-- linear buffer cycling with <Tab>/<S-Tab> remains handy for quick toggling,
-- especially when working with a small set of open files.
--
-- Consider using Telescope mappings for more advanced buffer/file navigation,
-- while keeping these keymaps for fast switching.
vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "<s-tab>", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", "<cmd>bp<bar>bd #<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", opts)

-- window management
vim.keymap.set("n", "<leader>v", "<c-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<c-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<c-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", "<cmd>close<CR>", opts) -- close current split window

-- navigate between splits with: <Ctrl> + h | j | k | l
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Keep visual selection after indenting:
-- In visual mode, using `<` or `>` to indent normally exits visual mode.
-- Adding `gv` tells Neovim to reselect the last visual selection (gv = "go visual"),
-- allowing you to press `<` or `>` repeatedly without manually reselecting the text.
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked text when pasting over a selection:
-- By default, pasting with `p` in visual mode yanks (copies) the selected text into the default register,
-- replacing what you had previously yanked.
-- This mapping uses the black hole register (`"_`) to discard the selected text before pasting,
-- so your original yank remains unchanged.
vim.keymap.set("v", "p", '"_dp', opts)

-- Move selected line(s) up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Markview stuff
vim.keymap.set("n", "<leader>mv", "<cmd>Markview toggle<cr>", { desc = "Toggle Markview" })
vim.keymap.set("n", "<leader>mvo", "<cmd>Markview enable<cr>", { desc = "Enable Markview" })
vim.keymap.set("n", "<leader>mvc", "<cmd>Markview disable<cr>", { desc = "Disable Markview" })
