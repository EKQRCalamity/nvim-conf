local BUFFERLINE = {}

BUFFERLINE.load = function() 
  return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
end

BUFFERLINE.setup = function()
  require("bufferline").setup({
    options = {
      indicator = {
        style = "underline",
      },
      always_show_bufferline = true,
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      seperator_style = "thin",
      tab_size = 12,
      max_name_length = 12,
      max_prefix_lenth = 11,
      themable = true,
    },
  })
end

return BUFFERLINE
