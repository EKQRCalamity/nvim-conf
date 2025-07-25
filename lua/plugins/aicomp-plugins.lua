local AI_PLUGINS = {
  markdown = {},
  diff = {},
  img_clip = {},
}

AI_PLUGINS.markdown.load = function()
  return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  }
end

AI_PLUGINS.diff.load = function()
  return {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        source = diff.gen_source.none(),
      })
    end
  }
end

AI_PLUGINS.img_clip.load = function()
  return {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  }
end

return AI_PLUGINS
