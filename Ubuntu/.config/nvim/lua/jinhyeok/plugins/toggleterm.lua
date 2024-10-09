return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require("toggleterm").setup{
            open_mapping = { [[<C-;>]], [[<C-\>]] },
            direction = 'horizontal',
            size = 15,
            on_open = function()
                vim.cmd('startinsert')
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-u>", true, false, true), 'n', true)
            end,
            insert_mappings = false,
        }

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            vim.keymap.set('t', '<C-o>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-k>', function()
                local curr_size = vim.api.nvim_win_get_height(0)
                vim.api.nvim_win_set_height(0, curr_size + 1)
            end, opts)
            vim.keymap.set('t', '<C-j>', function()
                local curr_size = vim.api.nvim_win_get_height(0)
                vim.api.nvim_win_set_height(0, curr_size - 1)
            end, opts)
            vim.keymap.set('t', '<C-h>', '<BS>', opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
