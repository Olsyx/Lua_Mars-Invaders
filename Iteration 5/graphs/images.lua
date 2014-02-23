
imageBank = {}


function loadImages()
	
    local path = "graphs/textures/"

	imageBank.player = love.graphics.newImage(path .. "player.png")
	imageBank.heartR = love.graphics.newImage(path .. "heartR.png")
	imageBank.heartL = love.graphics.newImage(path .. "heartL.png")
	imageBank.heartWR = imageBank.heartR:getWidth()
	imageBank.heartWL = imageBank.heartR:getWidth()
	imageBank.heartW = imageBank.heartWL + imageBank.heartWR
	imageBank.tries = love.graphics.newImage(path .. "coin.png")
	imageBank.triesW = imageBank.tries:getWidth()
	
	imageBank.mars = {}
	imageBank.mars[1] = love.graphics.newImage(path .. "mars1.png")
	imageBank.mars[2] = love.graphics.newImage(path .. "mars2.png")
	imageBank.mars[3] = love.graphics.newImage(path .. "mars3.png")
	
	imageBank.ovni = love.graphics.newImage(path .. "ovni.png")

	imageBank.bunkPiece = love.graphics.newImage(path .. "bpiece.png")
	
	imageBank.win = love.graphics.newImage(path .. "WIN.png")
	imageBank.loser = love.graphics.newImage(path .. "LOSER.png")
	
end