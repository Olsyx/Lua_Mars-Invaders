
imageBank = {}


function loadImages()
	
    local path = "graphs/textures/"

	imageBank.player = love.graphics.newImage(path .. "player.png")
	
	imageBank.mars = {}
	imageBank.mars[1] = love.graphics.newImage(path .. "mars1.png")
	imageBank.mars[2] = love.graphics.newImage(path .. "mars2.png")
	imageBank.mars[3] = love.graphics.newImage(path .. "mars3.png")
	
	imageBank.ovni = love.graphics.newImage(path .. "ovni.png")

	imageBank.bunkPiece = love.graphics.newImage(path .. "bpiece.png")
	
end