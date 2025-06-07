import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "entry"
import "car"

-- Player
-- Game is 400x240 resolution
local pd = playdate
local gfx = pd.graphics

local playerX = 40
local playerY = 120
local carImage = gfx.image.new("images/integra.png")

game_intro()

Car(playerX, playerY)

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
    -- 30/s (30FPS)
    --carImage:draw(playerX, playerY)
end