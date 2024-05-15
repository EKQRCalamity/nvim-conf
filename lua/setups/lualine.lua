local LUALINE = {}

LUALINE.load = function()
  return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
  }
end

LUALINE.setup = function()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      disabled_filetypes = { "NvimTree", "NVimTree" },
      theme = "palenight"
    }
  })

end

return LUALINE