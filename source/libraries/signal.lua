import "CoreLibs/object"

--[[
-- ... creating a global variable in main ...
NotificationCenter = Signal()

-- ... in code that needs to know when score has changed ...
NotificationCenter:subscribe("game_score", self, function(new_score, score_delta)
   self:update_score(new_score)
end)

-- ... in code that changes the score ...
NotificationCenter:notify("game_score", new_score, score_delta)

-- With returned function...
function Init()
	self.fn = signal:subscribe(
		"some-signal-name", self, function(foo, deng)
			...
		end
	)
end

function Remove()
	signal:unsubscribe("some-signal-name", self.fn)
end

]]

class("Signal").extends()

function Signal:init()
	self.listeners = {}
end

function Signal:subscribe(key, bind, fn)
	local t = self.listeners[key]
	local v = {fn = fn, bind = bind}
	if not t then
		self.listeners[key] = {v}
	else
		t[#t + 1] = v
	end
	return fn
end

function Signal:unsubscribe(key, fn)
	local t = self.listeners[key]
	if t then
		for i, v in ipairs(t) do
			if v.fn == fn then
				table.remove(t, i)
				break
			end
		end
		
		if #t == 0 then
			self.listeners[key] = nil
		end
	end
end

function Signal:notify(key, ...)
	local t = self.listeners[key]
	if t then
		for _, v in ipairs(t) do
			v.fn(v.bind, key, ...)
		end
	end
end