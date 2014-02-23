function love.load() 
	require("buss/player")
	require("buss/marsguys")
	require("buss/bullets")
	require("buss/levels")
	require("buss/leveldata")
	require("buss/system")
	require("buss/bunkers")
	require("buss/ovni")
	require("graphs/screen")
	require("graphs/images")
	
	loadTemps()
	loadImages()
	loadScreen()
	
	startPlayer( Screen.w/2 - imageBank.player:getWidth()/2 , playerPosY )
	
	firstLevel()
	
end

function love.update(dt)
	
	updateTemps(dt)
	
	if player.life <= 0 and player.tries >= 0 then
		player.tries = player.tries - 1
		setZeroBullets()
		marsList = {}
		startLevel( CurrentLevel )
		if level[CurrentLevel].ovni then healOvni() end
		healPlayer()
	elseif #marsList == 0 and not ovni.visible and CurrentLevel <= #level then
		nextLevel()
		love.timer.sleep(1)	
	elseif CurrentLevel <= #level and not checkMarsGuysReachLimit() and player.life > 0 then
		movePlayer()
		if level[CurrentLevel].ovni then	updateOvni(dt)	end
		updateMarsGuys(dt)
		updateBullets()		
	elseif checkMarsGuysReachLimit() then
		player.life = 0
	end

end

function love.draw()
--	love.graphics.setColor( 255 , 255 , 255 , 255 )
	drawMainScreen()
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	
	if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
	elseif key == "return" or key == "z" then
		if temp.pBullet >= player.noAtkSecs then
			addBullet( "player", player.mov.x + player.w/2, player.mov.y, player.atk, 1 , 0 )
			temp.pBullet = 0
		end	
	elseif key == "t" then		-- KILL THEM ALL
		marsList = {}
	elseif key == "o" then
		ovni.life = 0
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