-- vim.lsp.enable("gopls")
-- settingsvim.lsp.config("gopls", {
--     settings = {
--         gopls = {
--             semanticTokens = true,
--         }
--     }
-- })
-- local wk = require("which-key")
local ok, wk = pcall(require, "which-key")
if not ok then return end

wk.add({
    {"<leader>l", group="+lang"},
    {"<leader>lr", "<cmd>go run<cr>", desc="Go Run"},
    {"<leader>lb", "<cmd>go build<cr>", desc="Go Build"},
})
