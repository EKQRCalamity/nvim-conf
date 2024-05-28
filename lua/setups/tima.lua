local TIME = {}

local function get_time()
  return { os.date("%H:%M:%S") }
end

local function create_win(pos)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 8;
  local cols = {
    ["right"] = vim.o.columns,
    ["center"] = (vim.o.columns / 2) - ((width / 2) + 1),
    ["left"] = 0
  }
  local col
  if (cols[pos]) then
    col = cols[pos]
  else
    col = vim.o.columns - (width / 2) - 1
  end
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = 1,
    row = 0,
    col = col,
    style = "minimal",
    border = "single"
  })
  return buf, win
end

local function update_time(buf)
  local time = get_time()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, time)
end

TIME.setup = function(pos)
  local buf, _ = create_win(pos)
  update_time(buf)

  local timer = vim.loop.new_timer()

  timer:start(500, 500,
    vim.schedule_wrap(function()
      update_time(buf)
    end
  ))
end

return TIME