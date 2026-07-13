local my_autocmds = vim.api.nvim_create_augroup("MyCustomAutocmds", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
    group = my_autocmds,
    desc = "Open Telescope File Browser when opening a directory",
    callback = function(args)
        if vim.fn.isdirectory(args.file) == 1 then
            vim.cmd("silent! bd")
            vim.cmd.cd(args.file)
            vim.cmd("Telescope file_browser path=" .. vim.fn.fnameescape(args.file))
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = my_autocmds,
    desc = "Dynamically load language setup from lua/languages/",
    callback = function(args)
        local ft = args.match
        local ok, lang = pcall(require, "languages." .. ft)
        if ok and type(lang.setup_lang) == "function" then
            lang.setup_lang()
        end
    end,
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = my_autocmds,
    callback = function()
        if vim.bo.modified and vim.bo.buftype == "" and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
            vim.cmd("silent! write")
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = my_autocmds,
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = my_autocmds,
    pattern = "alpha",
    callback = function()
        vim.opt_local.showtabline = 0
        vim.opt_local.statusline = ""
    end,
})
