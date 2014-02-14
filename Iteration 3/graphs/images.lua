
imageBank = {}


function loadImages()
	
    local path = "graphs/textures/"

	imageBank.player = {}
	imageBank.player.image = love.graphics.newImage(path .. "player.png")
	imageBank.player.w = 64
	imageBank.player.h = 32
	
	imageBank.mars = {}
	imageBank.mars[1] = love.graphics.newImage(path .. "mars1.png")
	imageBank.mars[2] = love.graphics.newImage(path .. "mars2.png")
	imageBank.mars[3] = love.graphics.newImage(path .. "mars3.png")
	imageBank.mars.w = 31
	imageBank.mars.h = 31

end