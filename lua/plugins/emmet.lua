local EMMET = {}

EMMET.load = function()
  return {
    "mattn/emmet-vim",
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "html", "css", "svelte", "htmx", "php" },
        command = "EmmetInstall"
      })
    end
  }
end

return EMMET
