local M = {}

function M.select_inside_brackets()
    local skip_expr = "synIDattr(synID(line('.'), col('.'), 0), 'name') =~? 'string\\|comment'"

    local start_pos = vim.fn.searchpairpos("{", "", "}", "bnW", skip_expr)
    local end_pos = vim.fn.searchpairpos("{", "", "}", "nW", skip_expr)

    local start_line = start_pos[1]
    local end_line = end_pos[1]

    if start_line > 0 and end_line > 0 and start_line < end_line then
        if end_line - start_line > 1 then
            vim.cmd(string.format("normal! %dGV%dG", start_line + 1, end_line - 1))
        else
            vim.cmd(string.format("normal! %dGV", start_line))
        end
    end
end

return M
