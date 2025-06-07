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

local playerX = 200
local playerY = 120

Game_Intro()

Car(playerX, playerY)

function draw_patterned_background(x, y, width, height)
    gfx.setPattern({0xFF, 0xC9, 0x80, 0x80, 0xC1, 0xE3, 0xF7, 0xFF})
    gfx.fillRect(x, y, width, height)
end

playdate.graphics.sprite.setBackgroundDrawingCallback(draw_patterned_background)

function pd.update()
    gfx.sprite.update()

    playdate.drawFPS(0,0)
    
    pd.timer.updateTimers()
    -- 30/s (30FPS)
    --carImage:draw(playerX, playerY)
end