function love.load() 
	require("buss/player")
	require("buss/marsguys")
	require("buss/bullets")
	require("graphs/screen")
	
	for i = 1, 5 do addGuy() end
	
end

function love.update(dt)
	movePlayer()
	updateBullets()
end

function love.draw()

	love.graphics.setColor( 255 , 255 , 255 , 255 )

	drawMainScreen()
	
	
	love.graphics.print("#player: "..#bts["player"], 30, 450)

end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	
	if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
	elseif key == "return" or key == "z" then
	  addBullet( "player", player.mov.x, player.mov.y - 30, "1" )
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