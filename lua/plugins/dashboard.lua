return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.buttons.val = {
            dashboard.button("s", ">  Restore Last Session", ":lua require('persistence').load({ last = true })<CR>"),
            dashboard.button("p", ">  Recent Projects", ":Telescope projects<CR>"),
            dashboard.button("n", ">  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", ">  Find file",
                ":lua require('telescope.builtin').find_files({ cwd = vim.fn.getcwd() })<CR>"),
            dashboard.button("r", ">  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("c", ">  Config", ":e $MYVIMRC <BAR> cd %:p:h <CR>"),
            dashboard.button("q", ">  Quit", ":qa<CR>"),
        }

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        local handle = io.popen('nvim --version | head -n 1')
        if handle then
            local version = handle:read("*a")
            handle:close()
            dashboard.section.footer.val = version:gsub("\n", "")
        else
            dashboard.section.footer.val = "Neovim"
        end

        alpha.setup(dashboard.opts)
    end
}
