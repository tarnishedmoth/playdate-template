import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd = playdate
local gfx = pd.graphics

class('Car').extends(gfx.sprite)

function Car:init(x, y)
    local carImage = gfx.image.new("images/integra")
    self:setImage(carImage)
    self:moveTo(x, y)
    self:add()
end