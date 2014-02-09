
guyList = {}


function addGuy()
	local guy = {}
	
	guy.vel = 5
	
	guy.life = 3
	
	if #guyList < 5 then
		guyList[#guyList + 1] = guy
	end	
end