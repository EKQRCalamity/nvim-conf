local startColor = "#ffff3f"
local endColor   = "#06d6a0"

local timer  = vim.loop.new_timer()
local factor = 0.0
local step   = 0.01
local reverse = false

local function hex_to_rgb(hex)
  return tonumber("0x"..hex:sub(2,3)), tonumber("0x"..hex:sub(4,5)), tonumber("0x"..hex:sub(6,7))
end

local function rgb_to_hex(r,g,b)
  return string.format("#%02x%02x%02x", r, g, b)
end

-- Function to interpolate between two colors
local function interpolate_color(color1, color2, _factor)
  local r1, g1, b1 = hex_to_rgb(color1)
  local r2, g2, b2 = hex_to_rgb(color2)
  local r = math.floor(r1 + (r2 - r1) * _factor)
  local g = math.floor(g1 + (g2 - g1) * _factor)
  local b = math.floor(b1 + (b2 - b1) * _factor)
  return rgb_to_hex(r, g, b)
end

local function update_cursor()
  local color = interpolate_color(startColor, endColor, factor)

  vim.cmd(string.format("highlight CursorInsert guifg=NONE guibg=%s", color))
  vim.cmd(string.format("highlight lCursorInsert guifg=NONE guibg=%s", color))
  -- Change Cursor in normal mode to reverse
  vim.cmd("highlight Cursor gui=reverse")
  vim.cmd("highlight lCursor gui=reverse")

  if factor >= 1 then
    reverse = true
  elseif factor <= 0 then
    reverse = false
  end
  if reverse then
    factor = factor - step
  else
    factor = factor + step
  end
end

vim.opt.guicursor = {
  "n-v-c:block-blinkon100-Cursor/lCursor",
  "i:hor45-ver25-blinkon100-CursorInsert/lCursorInsert"
}

timer:start(0, 100, vim.schedule_wrap(update_cursor))