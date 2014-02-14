function love.load() 
	require("buss/player")
	require("buss/marsguys")
	require("buss/bullets")
	require("buss/levels")
	require("buss/system")
	require("graphs/screen")
	require("graphs/images")
	
	loadTemps()
	loadImages()
	loadScreen()
	
	startPlayer( Screen.w/2 - imageBank.player.w/2 , 350 )
	
	firstLevel()
	
end

function love.update(dt)
	
	updateTemps(dt)
	
	if #marsList == 0 and CurrentLevel <= #level then
		nextLevel()
		love.timer.sleep(1)	
	elseif CurrentLevel <= #level then
		movePlayer()
		updateMarsGuys(dt)
		updateBullets()		
	end

end

function love.draw()
--	love.graphics.setColor( 255 , 255 , 255 , 255 )
	drawMainScreen()
	
	love.graphics.print("Level "..CurrentLevel, 30, 470)

end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	
	if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
	elseif key == "return" or key == "z" then
	  addBullet( "player", player.mov.x + imageBank.player.w/2, player.mov.y, "1" )
	
	
	elseif key == "t" then		-- KILL THEM ALL
		marsList = {}
	elseif key == "k" then		-- SUICIDE
		player.life = 0
	
	end
	
end

function love.keyreleased(key, unicode)
end

function love.focus(f)
end

function love.quit()
end

function insideBox (px, py, x, y, wx, wy)
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end