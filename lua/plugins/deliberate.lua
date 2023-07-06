return {
    "ziontee113/deliberate.nvim",
    dependencies = {
        {
            "anuvyklack/hydra.nvim",
        },
    },
    config = function()
        local supported_filetypes = { "typescriptreact", "svelte" }
        local augroup = vim.api.nvim_create_augroup("DeliberateEntryPoint", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = supported_filetypes,
            group = augroup,
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                if vim.tbl_contains(supported_filetypes, vim.bo.ft) then
                    vim.keymap.set("n", "<Esc>", function()
                        vim.api.nvim_input("<Plug>DeliberateHydraEsc")
                    end, { buffer = bufnr })
                    vim.keymap.set("i", "<Plug>DeliberateHydraEsc", "<Nop>", {})
                end
            end,
        })

        require("deliberate.hydra")
    end,
}
