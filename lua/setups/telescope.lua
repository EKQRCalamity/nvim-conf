local TELESCOPE = {}

TELESCOPE.load_fzf = function()
  return {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
end

TELESCOPE.load = function()
  return {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" }
  }
end

return TELESCOPE