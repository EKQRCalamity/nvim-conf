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
      icons_enabled = false,
      theme = "auto",
      section_separators = { left = '', right = '' },
      component_separators = { left = '-', right = '-' },
      disabled_filetypes = { "NvimTree", "Lazy" },
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { "branch", "mode" },
      lualine_b = { "location", "selectioncount" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "diff", "diagnostics" },
      lualine_z = { "filesize", "filetype" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "nvim-tree" },
  })
end

return LUALINE
