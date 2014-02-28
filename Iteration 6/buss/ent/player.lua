player = {
			mov = { x = nil, y = nil, vel = 2 },
			w = nil,
			h = nil,
			life = nil,
			tries = nil,
			atk = nil,
			noAtkSecs = nil,
			score = nil,
		}

		
function startPlayer( x , y )

	setPlayer( x , y )
	
	healPlayer()
	player.tries = MenuCoins
	
	player.atk = 1
	player.noAtkSecs = 0.5
	player.score = 0
	
	player.w = imageBank.player:getWidth()
	player.h = imageBank.player:getHeight()
	
end

function setPlayer( x , y )
	player.mov.x = x
	player.mov.y = y
end
	
function healPlayer()
	player.life = 3
end
	
function grantPlayer( life, atk )
	player.life = player.life + life
	player.atk = player.atk + atk
	print("granted")
end
	
	
function movePlayer(key)

	if love.keyboard.isDown("a", "left") then
		if player.mov.x > -(player.w/2) then 
			player.mov.x = player.mov.x - player.mov.vel	
			if player.mov.x < -(player.w/2) then 
				player.mov.x = -(player.w/2) 
			end	
		end
	elseif love.keyboard.isDown("d", "right") then
		if player.mov.x < Screen.w - (player.w/2) then 
			player.mov.x = player.mov.x + player.mov.vel		
			if player.mov.x > Screen.w - (player.w/2) then 
				player.mov.x = Screen.w -(player.w/2) 
			end
		end
	end

end