local MOD = {}

MOD.fluoromachine = function()
  return {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("fluoromachine").setup({
        glow = true,
        brightness = 0.3, -- Background Brightness
        theme = "delta"
      })
      vim.cmd.colorscheme = "fluoromachine"
    end
  }
end

MOD.poimandres = function()
  return {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        bold_vert_split = true,
        dim_nc_background = false,
      })
      vim.cmd.colorscheme("poimandres")
    end
  }
end

MOD.mellifluous = function()
  return {
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("mellifluous").setup({})
      vim.cmd.colorscheme("mellifluous")
    end
  }
end

MOD.oldworld = function()
  return {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        integrations = {
          alpha = true,
          cmp = true,
          indent_blankline = true,
          lazy = true,
          lsp = true,
          mason = true,
        }
      })
      vim.cmd.colorscheme("oldworld")
    end
  }
end

MOD.nightfox = function(mode)
  mode = mode or "night"
  return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          dim_inactive = true,
          terminal_colors = true,
          styles = {}
        }
      })
      if (mode == "day")
      then
        vim.cmd.colorscheme("dayfox")
      elseif (mode == "tera")
      then
        vim.cmd.colorscheme("terafox")
      elseif (mode == "dawn")
      then
        vim.cmd.colorscheme("dawnfox")
      elseif (mode == "carbon")
      then
        vim.cmd.colorscheme("carbonfox")
      elseif (mode == "dusk")
      then
        vim.cmd.colorscheme("duskfox")
      elseif (mode == "nord")
      then
        vim.cmd.colorscheme("nordfox")
      else
        vim.cmd.colorscheme("nightfox")
      end
    end
  }
end

MOD.bamboo = function(mode)
  local style = "vulgaris"
  if (mode == "light")
  then
    style = "light"
  elseif (mode == "multiplex" or mode == "greener")
  then
    style = "multiplex"
  end

  return {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        style = style,
        toggle_style_key = nil,
        dim_inactive = true,
        term_colors = true,
      })
      vim.cmd.colorscheme("bamboo")
    end
  }
end

MOD.moonfly = function()
  return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
    end
  }
end

MOD.catppuccin = function(mode)
  local flavour = mode or "auto"

  if (mode == "frappe")
  then
    flavour = "frappe"
  elseif (mode == "macchiato")
  then
    flavour = "macchiato"
  elseif (mode == "mocha")
  then
    flavour = "mocha"
  elseif (mode == "latte")
  then
    flavour = "latte"
  end

  return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = flavour,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.2,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end
  }
end

MOD.citruszest = function()
  return {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("citruszest").setup({})
      vim.cmd.colorscheme("citruszest")
    end
  }
end

MOD.aurora = function()
  return {
    "ray-x/aurora",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("aurora")
    end
  }
end

MOD.zephyr = function()
  return {
    "glepnir/zephyr-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("zephyr")
    end
  }
end

MOD.oh_lucy = function(mode)
  if (mode == "evening")
  then
    mode = "oh-lucy-evening"
  else
    mode = "oh-lucy"
  end
  return {
    "Yazeed1s/oh-lucy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(mode)
    end
  }
end

MOD.minimal = function(mode)
  local flavour = mode or "minimal"
  if (mode == "base16")
  then
    flavour = "minimal-base16"
  end
  return {
    "Yazeed1s/minimal.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(flavour)
    end
  }
end

MOD.modus = function(mode)
  local flavour
  if (mode == "operandi")
  then
    flavour = "modus-operandi"
  else
    flavour = "modus-vivendi"
  end
  return {
    "ishan9299/modus-theme-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(flavour)
    end
  }
end

MOD.everblush = function()
  return {
    "Everblush/nvim",
    name = "everblush",
    config = function()
      vim.cmd.colorscheme("everblush")
    end
  }
end

MOD.evergarden = function(contrast)
  if (contrast ~= "high" and contrast ~= "low" and contrast ~= "medium")
  then
  contrast = "medium"
  end
  return {
    "comfysage/evergarden",
    opts = {
      contrast_dark = contrast
    },
    config = function()
      vim.cmd.colorscheme("evergarden")
    end
  }
end

return MOD