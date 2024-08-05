vim.g.mapleader = " " -- leader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<C-c>", "<Esc>")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("v", "<C-c>", "<Esc>")
keymap.set("c", "<C-c>", "<Esc>")
keymap.set("s", "<C-c>", "<Esc>")
keymap.set("o", "<C-c>", "<Esc>")

keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>q", "<C-w>q", { desc = "Close split" })
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to down split" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to up split" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right split" })


keymap.set("n", "<C-j>", "<C-e>", { desc = "Scroll screen down by one line" })
keymap.set("n", "<C-k>", "<C-y>", { desc = "Scroll screen up by one line "})
keymap.set("i", "<C-j>", "<Esc><C-e>a", { desc = "Scroll screen down by one line" })
keymap.set("i", "<C-k>", "<Esc><C-y>a", { desc = "Scroll screen up by one line "})

keymap.set("i", "<C-l>", "<Right>", { desc = "Move the cursor one space to the right" });
keymap.set("i", "<C-;>", "<C-o>A", { desc = "Move the cursor one space to the right" });
keymap.set("n", "<C-l>", "O<Esc>", { desc = "Insert a line "})
keymap.set("n", "<C-s>", "i <Esc>", { desc = "Insert a space "})

keymap.set("n", "<ScrollWheelLeft>", "<Cmd>normal! 3zl<CR>", { noremap = true, silent = true })
keymap.set("n", "<ScrollWheelRight>", "<Cmd>normal! 3zh<CR>", { noremap = true, silent = true })
keymap.set("i", "<ScrollWheelLeft>", "<Cmd>normal! 3zl<CR>", { noremap = true, silent = true })
keymap.set("i", "<ScrollWheelRight>", "<Cmd>normal! 3zh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cc", function()
    local buf = vim.api.nvim_get_current_buf()
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buftype ~= 'nofile' then
        vim.cmd(':w')
    end

    local term_buf_exists = vim.fn.bufexists('term://*')
    local term_buf_visible = vim.fn.bufwinnr('term://*') ~= -1
    local current_file = vim.fn.expand('%')
    if not term_buf_exists or not term_buf_visible then
        vim.cmd('ToggleTerm')
    elseif term_buf_visible then
        vim.cmd('ToggleTerm')
        vim.cmd('ToggleTerm')
    end

    vim.api.nvim_feedkeys("clang_e " .. current_file .. "\n", "n", false)
end, { desc = "Compile and Execute current C file" })

vim.keymap.set("n", "<leader>cp", function()
    local buf = vim.api.nvim_get_current_buf()
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buftype ~= 'nofile' then
        vim.cmd(':w')
    end

    local term_buf_exists = vim.fn.bufexists('term://*')
    local term_buf_visible = vim.fn.bufwinnr('term://*') ~= -1
    local current_file = vim.fn.expand('%')
    if not term_buf_exists or not term_buf_visible then
        vim.cmd('ToggleTerm')
    elseif term_buf_visible then
        vim.cmd('ToggleTerm')
        vim.cmd('ToggleTerm')
    end

    vim.api.nvim_feedkeys("clang++_e " .. current_file .. "\n", "n", false)
end, { desc = "Compile and Execute current C++ file" })

vim.keymap.set("n", "<leader>mc", function()
    local buf = vim.api.nvim_get_current_buf()
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    local modified = vim.api.nvim_buf_get_option(buf, 'modified')
    if buftype ~= 'nofile' and modified then
        vim.cmd(':w')
    end

    local term_buf_exists = vim.fn.bufexists('term://*')
    local term_buf_visible = vim.fn.bufwinnr('term://*') ~= -1
    if not term_buf_exists or not term_buf_visible then
        vim.cmd('ToggleTerm')
    elseif term_buf_visible then
        vim.cmd('ToggleTerm')
        vim.cmd('ToggleTerm')
    end

    vim.api.nvim_feedkeys("make && ./main\n", "n", false)
end, { desc = "Make and Execute current C/C++ project" })
