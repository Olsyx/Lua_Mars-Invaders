player = {
			mov = { x = nil, y = nil, vel = 2 },
			w = nil,
			h = nil,
			life = 3,
			atk = 1,
		}

		
function startPlayer( x , y )

	player.mov.x = x
	player.mov.y = y
	
	player.w = imageBank.player.w
	player.h = imageBank.player.h
	
end
		
function movePlayer(key)

	if love.keyboard.isDown("a", "left") then
		player.mov.x = player.mov.x - player.mov.vel	
		if player.mov.x < -50 then player.mov.x = Screen.w + 50 end	
	elseif love.keyboard.isDown("d", "right") then
		player.mov.x = player.mov.x + player.mov.vel		
		if player.mov.x > Screen.w + 50 then player.mov.x = -50 end
	end

end