-- Player
-- Game is 400x240 resolution
local pd = playdate
local gfx = pd.graphics

local playerX = 40
local playerY = 120
local carImage = gfx.image.new("images/integra.png")

function pd.update()
    -- 30/s (30FPS)
    carImage:draw(playerX, playerY)
    
end