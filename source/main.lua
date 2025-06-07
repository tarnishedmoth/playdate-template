-- Player
-- Game is 400x240 resolution
local pd = playdate
local gfx = pd.graphics

local playerX = 40
local playerY = 120
local playerImage = gfx.image.new("images/shadedball.png")

function pd.update()
    -- 30/s (30FPS)
    playerImage:draw(playerX, playerY)
    
end