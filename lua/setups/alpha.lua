local ALPHA = {}

ALPHA.add_quote = function(arr)
  local quotes = {
    {
      [[        "Estoy sufriendo las penas del        ]],
      [[    infierno sin ni siquiera haber muerto."   ]],
      [[       - Orhan Pamuk, Me llamo Rojo -         ]]
    },
    {
      [[    "Immersing oneself in the problems of     ]],
      [[          of a book is a good way             ]],
      [[       to keep from thinking of love."        ]],
      [[           - Orhan Pamuk, Snow -              ]]
    },
    {
      [[      "Art is the proper task of life"        ]],
      [[          - Friedrich Nietzsche -             ]]
    },
    {
      [[ "They muddy the water, to make it seem deep" ]],
      [[          - Friedrich Nietzsche -             ]]
    },
    {
      [[     "The more depressed and maladjusted     ]],
      [[   you are, the more likely it is that you   ]],
      [[ are seeing things right, with minimal bias" ]],
      [[      - John Derbshire, We Are Doomed -      ]]
    },
    {
      [[  "Escribir es como besar, pero sin labios.  ]],
      [[       Escribir es besar con la mente."      ]],
      [[            - Daniel Glattauer -             ]]
    }
  }

  math.randomseed(os.time() + 44)
  local ind = math.random(#quotes)
  local str = quotes[ind]
  for _, line in ipairs(str) do
    table.insert(arr, line)
  end
  return arr;
end

ALPHA.load = function ()
  return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      local dashboard = require("alpha.themes.dashboard");
      dashboard.section.header.val = {
        [[    ⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⢶⣦⡀ ]],
        [[   ⠀⠀⣴⡿⠟⠷⠆⣠⠋⠀⠀⠀⢸⣿ ]],
        [[   ⠀⠀⣿⡄⠀⠀⠀⠈⠀⠀⠀⠀⣾⡿ ]],
        [[  ⠀⠀⠀⠹⣿⣦⡀⠀⠀⠀⠀⢀⣾⣿ ]],
        [[   ⠀⠀⠀⠈⠻⣿⣷⣦⣀⣠⣾⡿ ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⡿⠟                             ]],
        [[      ⠀⠀⠀⠀⠀⡟⠀⠀⠀⢠⠏⡆⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⡀             ]],
        [[     ⠀⠀⡟⢦⡀⠇⠀⠀⣀⠞⠀⠀⠘⡀⢀⡠⠚⣉⠤⠂⠀⠀⠀⠈⠙⢦⡀           ]],
        [[    ⠀⠀⠀⡇⠀⠉⠒⠊⠁⠀⠀⠀⠀⠀⠘⢧⠔⣉⠤⠒⠒⠉⠉⠀⠀⠀⠀⠹⣆          ]],
        [[   ⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⣤⠶⠶⢶⡄⠀⠀⠀⠀⢹⡆        ]],
        [[  ⠀⣀⠤⠒⠒⢺⠒⠀⠀⠀⠀⠀⠀⠀⠀⠤⠊⠀⢸⠀⡿⠀⡀⠀⣀⡟⠀⠀⠀⠀⢸⡇         ]],
        [[  ⠈⠀⠀⣠⠴⠚⢯⡀⠐⠒⠚⠉⠀⢶⠂⠀⣀⠜⠀⢿⡀⠉⠚⠉⠀⠀⠀⠀⣠⠟           ]],
        [[  ⠀⠠⠊⠀⠀⠀⠀⠙⠂⣴⠒⠒⣲⢔⠉⠉⣹⣞⣉⣈⠿⢦⣀⣀⣀⣠⡴⠟⠁            ]],
        [[   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠀⠉⠉⠉                        ]],
      };

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("t", "  Live Grep", ":Telescope live_grep <CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
      };

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true

      require("alpha").setup(dashboard.opts);
    end
  }
end

return ALPHA