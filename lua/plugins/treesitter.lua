local TREESITTER = {}

TREESITTER.load = function()
  return {
    "nvim-treesitter/nvim-treesitter",
  }
end

TREESITTER.update = function()
  -- Suppress the "All parsers are up-to-date!" message on startup
  vim.cmd("silent! :TSUpdate")
end

return TREESITTER
