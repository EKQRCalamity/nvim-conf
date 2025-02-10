local TIMAR = {}

TIMAR.setup = function(posX, posY, border)
  local function get_time()
    return { os.date("%H:%M:%S") }
  end

  local function update_time(buf)
    local ascii_time = get_time()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, ascii_time)
  end


  local buf, _ = TIMAR.setup_window(posX, posY, border)

  update_time(buf)

  local timer = vim.loop.new_timer()
  timer:start(250, 250, vim.schedule_wrap(function()
    update_time(buf)
  end))
end

TIMAR.setup_window = function (posX, posY, border)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 8
  local height = 1

  local col = 1000
  local row = 0

  if (border == nil) then
    border = "single"
  end

  if (posX == "center") then
    col = vim.o.columns - ((vim.o.columns + width) / 2)
  elseif (posX == "left") then
    col = 1
  end

  if (posY == "center") then
    row = vim.o.lines - ((vim.o.lines + height) / 2)
  elseif (posY == "bottom" or posY == "bot") then
    row = vim.o.lines - height - 1
  end

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = border,
  })
  return buf, win
end

return TIMAR;
