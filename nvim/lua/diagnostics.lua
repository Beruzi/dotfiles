---------------------------
--- [[ Diagnostics ]] ---
---------------------------
vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,

    float = {
        border = "rounded",
        source = "if_many",
    },

    jump = {
        wrap = true,
        on_jump = function(diagnostic, bufnr)
            if not diagnostic then
                return
            end

            vim.diagnostic.open_float({
                bufnr = bufnr,
                scope = "cursor",
                focus = false,
            })
        end,
    },
})
