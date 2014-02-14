level = {
			[1] = { vel = 5, pxl = 1, maxShooters = 3,
					guyLines = { [1] = { nGuys = 5, typGuy = 1 },
								 [2] = { nGuys = 5, typGuy = 1 },
								 [3] = { nGuys = 5, typGuy = 1 },
							  },
				  },
			[2] = { vel = 4, pxl = 2, maxShooters = 5,
					guyLines = {
								[1] = { nGuys = 7, typGuy = 3 },
								[2] = { nGuys = 7, typGuy = 3 },
								[3] = { nGuys = 6, typGuy = 2 },
								[4] = { nGuys = 5, typGuy = 1 }
							  }
				  },
		}
		
CurrentLevel = 0

function firstLevel()
	CurrentLevel = 1
	startLevel(CurrentLevel)
end

function startLevel( numlevel )
	local totalLines = #level[numlevel].guyLines
	local nGuys, dist
	
	for l = 1, #level[numlevel].guyLines do
		nGuys = level[numlevel].guyLines[l].nGuys
		dist = Screen.w/nGuys
		dGuys = (dist - imageBank.mars.w)/2
		for m = 1, nGuys do
			addGuy( (m-1)*dist + dGuys, 40 + (l - 1) * 40, level[numlevel].guyLines[l].typGuy ) 
		end
	end	
end

function nextLevel()
	
	CurrentLevel = CurrentLevel + 1
	
	if CurrentLevel <= #level then
		setPlayer( Screen.w/2 - imageBank.player.w/2 , 350 )
		setZeroBullets()
		startLevel(CurrentLevel)
	end
	
end