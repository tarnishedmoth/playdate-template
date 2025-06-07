-- below via Nick Magnier c.2020 Playdate Dev Forums
-- https://devforum.play.date/t/a-list-of-helpful-libraries-and-code/221/18

function math.clamp(a, min, max)
    if min > max then
        min, max = max, min
    end
    return math.max(min, math.min(max, a))
end

--[[
Like clamp but instead of clamping it loop back to the start. Useful to cycle through values,
for example an index in a menu.
index = math.ring_int( index + 1, 1, 4)
-> 1, 2, 3, 4, 1, 2, 3, 4 etc.
]]
function math.ring(a, min, max)
    if min > max then
        min, max = max, min
    end
    return min + (a-min)%(max-min)
end

function math.ring_int(a, min, max)
    return math.ring(a, min, max + 1)
end

function table.random(t)
    if type(t) ~= "table" then return nil end
    return t[math.ceil(math.random(#t))]
end

function table.each(t, fn)
    if type(fn) ~= "function" then return end
    for _, e in pairs(t) do
        fn(e)
    end
end

-- below via Nick Splendor

-- from http://lua-users.org/wiki/SimpleRound
-- rounds v to the number of places in bracket, i.e. 0.01, 0.1, 1, 10, etc
function math.round( number, bracket )
	bracket = bracket or 1
	
	-- path for additional precision 
	if bracket<1 then
		bracket = 1//bracket
		local half = (number >= 0 and 0.5) or -0.5
		return (number*bracket+half)//1/bracket
	end

	local half = (number >= 0 and bracket/2) or -bracket/2
	return ((number+half)//bracket)*bracket
end
-- round needs sign:
function math.sign(v)
    return (v >= 0 and 1) or -1
end

function UUID()
  local fn = function(x)
    local r = math.random(16) - 1
    r = (x == "x") and (r + 1) or (r % 4) + 9
    return ("0123456789abcdef"):sub(r, r)
  end
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end