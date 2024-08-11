local M = {}

M.tograyscale = function(hex)
  -- Remove the '#' if it's present
  hex = hex:gsub('#', '')

  -- Convert the hex color to RGB
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Calculate the grayscale value using the luminance formula
  local gray = math.floor(0.299 * r + 0.587 * g + 0.114 * b) - 5

  -- Convert the grayscale value back to hex
  local grayscaleHex = string.format('#%02X%02X%02X', gray, gray, gray)

  return grayscaleHex
end

return M
