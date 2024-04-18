-- local function check_json_key_exists(filename, key)
--   local file = io.open(filename, "r")
--   if not file then
--     return false
--   end

--   local content = file:read "*all"
--   file:close()

--   local json_parsed, json = pcall(vim.fn.json_decode, content)
--   if not json_parsed or type(json) ~= "table" then
--     return false -- Invalid JSON format
--   end

--   return json[key] ~= nil
-- end

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.has_file ".prettierrc"
              or utils.has_file ".prettierrc.json"
              or utils.has_file ".prettierrc.yml"
              or utils.has_file ".prettierrc.yaml"
              or utils.has_file ".prettierrc.json5"
              or utils.has_file ".prettierrc.js"
              or utils.has_file ".prettierrc.cjs"
              or utils.has_file "prettier.config.js"
              or utils.has_file ".prettierrc.mjs"
              or utils.has_file "prettier.config.mjs"
              or utils.has_file "prettier.config.cjs"
              or utils.has_file ".prettierrc.toml"
              -- or check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
          end,
        }),
        null_ls.builtins.formatting.biome,
      },
      on_attach = function(client, bufnr)
        -- not working??
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
      debug = true,
    })
  end,
}
