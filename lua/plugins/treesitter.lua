local function get_parsers()
    local parsers = {
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
    }

    local lang_dir = vim.fn.stdpath("config") .. "/lua/languages"

    for name, entry_type in vim.fs.dir(lang_dir) do
        if entry_type == "file" and name:sub(-4) == ".lua" then
            local module = "languages." .. name:sub(1, -5)

            local ok, lang = pcall(require, module)
            if ok and lang.parser then
                if type(lang.parser) == "string" then
                    table.insert(parsers, lang.parser)
                elseif type(lang.parser) == "table" then
                    vim.list_extend(parsers, lang.parser)
                end
            end
        end
    end

    return parsers
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
    config = function()
        local ts = require("nvim-treesitter")

        ts.install(get_parsers())
    end,
}
