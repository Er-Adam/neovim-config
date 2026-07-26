local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

keymap.set("n", "gb", "<C-o>", { noremap = true, silent = true, desc = "Go back in jumplist" })
keymap.set("n", "gf", "<C-i>", { noremap = true, silent = true, desc = "Go forward in jumplist" })

-- split window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-x>", "<cmd>close<CR>", { desc = "Close window" })

-- tab navigation
vim.keymap.set("n", "<M-h>", "gT", { desc = "Previous tab" })
vim.keymap.set("n", "<M-l>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<M-x>", "<cmd>tabclose<CR>", { desc = "Close Tab" })

vim.keymap.set("n", "<leader>h", "<cmd>Alpha<CR>", { desc = "Open Alpha dashboard", })


-- Move line/block down/up
vim.keymap.set({ "n", "v" }, "<M-j>", function()
    if vim.fn.mode() == "n" then
        vim.cmd("move .+1")
        vim.cmd("normal! ==")
    else
        vim.cmd("move '>+1")
        vim.cmd("normal! gv=gv")
    end
end, { desc = "Move line/block down" })
vim.keymap.set({ "n", "v" }, "<M-k>", function()
    if vim.fn.mode() == "n" then
        vim.cmd("move .-2")
        vim.cmd("normal! ==")
    else
        vim.cmd("move '<-2")
        vim.cmd("normal! gv=gv")
    end
end, { desc = "Move line/block up" })
