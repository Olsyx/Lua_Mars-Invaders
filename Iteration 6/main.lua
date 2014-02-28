function love.load() 

	require("graphs/screen")
	require("graphs/images")
	
	require("buss/infra/levels")
	require("buss/infra/leveldata")
	require("buss/infra/menu")
	require("buss/infra/system")

	require("buss/ent/player")
	require("buss/ent/marsguys")
	require("buss/ent/ovni")
		
	require("buss/bunkers")		
	require("buss/bullets")
	
	loadTemps()
	loadImages()
	loadButtons()
	loadScreen()
	
end

function love.update(dt)
	
	if State == "Game" then
		updateGame( dt )	
	elseif State == "Menu" then
		updateMenu( dt )	
	end

end

function love.draw()
--	love.graphics.setColor( 255 , 255 , 255 , 255 )

	local Mx = love.mouse.getX()
	local My = love.mouse.getY()

	if State == "Game" then
		drawGameScreen( Mx , My )	
	elseif State == "Menu" then
		drawMenuScreen( Mx , My )	
	end

end

function love.mousepressed(x, y, button)
	buttonPressed( button , x , y )
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