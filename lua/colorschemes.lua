local COLORSCHEMES = {}

COLORSCHEMES.colorschemes = function()
  return {
    "olivercederborg/poimandres.nvim",
    "dgox16/oldworld.nvim",
    "zootedb0t/citruszest.nvim",
    "bluz71/vim-moonfly-colors",
    "ray-x/aurora",
    "EdenEast/nightfox.nvim",
    "glepnir/zephyr-nvim",
    "savq/melange-nvim",
    { "Everblush/nvim", name = "everblush" },
    { "catppuccin/nvim", name = "catppuccin" },
    {
      "0xstepit/flow.nvim",
      lazy = false,
      opts = {
        theme = {
          style = "dark",
          transparent = true,
        },
      },
    },
    {
      "ficcdaf/ashen.nvim",
      lazy = false,
      opts = {
        style_presets = {
          bold_functions = true,
          italic_comments = true,
        },
      },
    },
    {
      "ribru17/bamboo.nvim",
      lazy = false,
      config = function()
        require("bamboo").setup({})
      end
    },
    {
      "zenbones-theme/zenbones.nvim",
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
    },
    {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function ()
        require("kanagawa").setup({
          transparent = true,
        })
      end
    },
    {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      priority = 1000,
      config = function ()
        require("cyberdream").setup({
          transparent = true,
        })
      end
    }
  }
end

return COLORSCHEMES
