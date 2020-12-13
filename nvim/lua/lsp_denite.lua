local vim = vim
local util = require 'vim.lsp.util'

local M = {}

-- local symbol_handler = function(_, _, result, _, bufnr)
--   if not result or vim.tbl_isempty(result) then return end
--   vim.b.document_symbols = util.symbols_to_items(result, bufnr)
-- end
local function get_available_client(method)
  for id, client in pairs(vim.lsp.buf_get_clients()) do
    if client['resolved_capabilities'][method] == true then
      return id
    end
  end
  return 0
end

function M.document_symbol()
  local params = { textDocument = util.make_text_document_params() }
  local raw_result = vim.lsp.buf_request_sync(0, 'textDocument/documentSymbol', params, 1000)
  local client_id = get_available_client('document_symbol')
  if client_id == 0  or raw_result == nil then
    return nil
  end
  vim.b.document_symbols = raw_result
  local result = util.symbols_to_items(raw_result[client_id].result, 0)
  return result
end

return M
