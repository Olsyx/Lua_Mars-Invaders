Screen = { 
			w = 300,
			h = 500
		 }


function drawMainScreen()
	drawEntities()
	drawPlayerStats()	
end

function drawEntities()
	for m = 1, #guyList do
		love.graphics.circle("line", (m - 1) * 60 + 30 , 50 , 25, 10 ) 	
	end
	love.graphics.circle("line", player.mov.x , player.mov.y , 25, 10 )
	
	for b = 1, #bts["mars"] do
		love.graphics.rectangle("fill", bts["mars"][b].x - 2, bts["mars"][b].y, 4, 8) 
	end
	
	for b = 1, #bts["player"] do
		love.graphics.rectangle("fill", bts["player"][b].x - 2, bts["player"][b].y, 4, 8) 
	end
end

function drawPlayerStats()
	love.graphics.line( 0,400 , 300,400 )
	love.graphics.print("HEARTS: "..player.life, 30, 410)
	love.graphics.print("POWER: "..player.atk, 200, 410)
end