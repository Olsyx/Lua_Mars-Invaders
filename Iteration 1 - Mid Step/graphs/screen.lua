Screen = { 
			w = 300,
			h = 500
		 }


function drawMainScreen()
	if #marsList > 0 then
		drawEntities()
		drawPlayerStats()
	else
		love.graphics.print("WIN!", 30, 200, 0, 7, 7)
	end
end

function drawEntities()

	-- MARS GUYS
	for m = 1, #marsList do
		love.graphics.circle("line", marsList[m].x , marsList[m].y , marsList[m].w/2, 10 ) 	
		love.graphics.rectangle("line", marsList[m].x - marsList[m].w/2, marsList[m].y - marsList[m].h/2, marsList[m].w, marsList[m].h )
	end
	
	-- PLAYER
	love.graphics.circle("line", player.mov.x , player.mov.y , 25, 10 )
	
	-- BULLETS
	for b = 1, #bts["mars"] do
		love.graphics.rectangle("fill", bts["mars"][b].x - 2, bts["mars"][b].y, 4, 8) 
	end
	
	for b = 1, #bts["player"] do
		love.graphics.rectangle("fill", bts["player"][b].x - 2, bts["player"][b].y, 4, 8) 
	end
end

function drawPlayerStats()
	love.graphics.line( 0,Screen.h-(Screen.h/5) , Screen.w,Screen.h-(Screen.h/5) )
	love.graphics.print("HEARTS: "..player.life, 30, 410)
	love.graphics.print("POWER: "..player.atk, 200, 410)
end