local TELESCOPE = {}

TELESCOPE.load = function()
  return {
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.6",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep"
      },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
  }
end

return TELESCOPE
