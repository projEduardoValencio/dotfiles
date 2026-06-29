local M = {}

function M.foldexpr(lnum)
  local line = vim.fn.getline(lnum)
  local hashes = line:match("^(#+)%s+")

  if hashes then
    return ">" .. #hashes
  end

  return "="
end

return M
