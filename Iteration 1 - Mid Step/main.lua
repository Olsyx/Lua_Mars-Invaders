function love.load() 
	require("buss/player")
	require("buss/marsguys")
	require("buss/bullets")
	require("buss/levels")
	require("graphs/screen")
	
	--startLevel( CurrentLevel )
	startLevel( 2 )
	
end

function love.update(dt)
	movePlayer()
	updateMarsGuys()
	updateBullets()

end

function love.draw()
--	love.graphics.setColor( 255 , 255 , 255 , 255 )
	drawMainScreen()
	
	
--	love.graphics.print("#mars guys: "..#marsList, 50, 450)
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	
	if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
	elseif key == "return" or key == "z" then
	  addBullet( "player", player.mov.x - imageBank.player.w, player.mov.y - imageBank.player.h, "1" )
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