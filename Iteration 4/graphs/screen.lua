Screen = { 
			w = nil,
			h = nil,
			downLimit = nil
		 }


function loadScreen()
	Screen.w = love.window.getWidth()
	Screen.h = love.window.getHeight()
	Screen.downLimit = Screen.h-(Screen.h/5)
end	 
		 
function drawMainScreen()
	if #marsList > 0 and player.life > 0 then
		drawEntities()
		drawPlayerStats()		
	elseif player.life <= 0 then
		love.graphics.print("LOSER.", 20, 200, 0, 7, 7)
	elseif CurrentLevel > #level  then
		love.graphics.print("WIN!", 30, 200, 0, 7, 7)
	end
end

function drawEntities()
	-- // MARS GUYS //
	for m = 1, #marsList do
		love.graphics.draw( imageBank.mars[marsList[m].tGuy], marsList[m].x, marsList[m].y  )
	--	love.graphics.print( "Life: "..marsList[m].life, marsList[m].x, marsList[m].y + marsList[m].h + 2 )
	end
	
	-- // PLAYER //
	love.graphics.draw( imageBank.player, player.mov.x, player.mov.y )
	
	-- // BULLETS //
	for b = 1, #bts["mars"] do
		love.graphics.rectangle("fill", bts["mars"][b].x - 2, bts["mars"][b].y, bts["mars"][b].w, bts["mars"][b].h) 
	end
	
	for b = 1, #bts["player"] do
		love.graphics.rectangle("fill", bts["player"][b].x - 2, bts["player"][b].y, bts["player"][b].w, bts["player"][b].h) 
	end
	
	-- // BUNKERS //
	if level[CurrentLevel].bunker then 
		drawBunkers()		
	end
end

function drawPlayerStats()
	love.graphics.line( 0,Screen.downLimit , Screen.w,Screen.downLimit )
	love.graphics.print("HEARTS: "..player.life, 30, 410)
	love.graphics.print("POWER: "..player.atk, 200, 410)				
	love.graphics.print("Level: "..CurrentLevel, 30, 450)
	love.graphics.print("Score: ", 200, 450)
	love.graphics.print(player.score, 200, 470)
end