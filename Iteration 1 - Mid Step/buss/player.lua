player = {
			mov = { x = 150, y = 350, vel = 2 },
			w = 50,
			h = 50,
			life = 5,
			atk = 1,
		}

		
function movePlayer(key)

	if love.keyboard.isDown("a", "left") then
		player.mov.x = player.mov.x - player.mov.vel	
		if player.mov.x < -50 then player.mov.x = Screen.w + 50 end	
	elseif love.keyboard.isDown("d", "right") then
		player.mov.x = player.mov.x + player.mov.vel		
		if player.mov.x > Screen.w + 50 then player.mov.x = -50 end
	end

end