		
CurrentLevel = 0

function firstLevel()
	CurrentLevel = 1
	if level[CurrentLevel].bunker then startBunkers( level[CurrentLevel].bunkerLife ) end
	startLevel(CurrentLevel)
end

function startLevel( numlevel )
	local totalLines = #level[numlevel].guyLines
	local nGuys, dist, marsWidth
	
	for l = 1, #level[numlevel].guyLines do
		nGuys = level[numlevel].guyLines[l].nGuys
		dist = Screen.w/nGuys
		marsWidth = imageBank.mars[ level[numlevel].guyLines[l].typGuy ]:getWidth()
		dGuys = (dist - marsWidth)/2
		for m = 1, nGuys do
			addGuy( (m-1)*dist + dGuys, 40 + (l - 1) * 40, level[numlevel].guyLines[l].typGuy ) 
		end
	end	
end

function nextLevel()
	
	CurrentLevel = CurrentLevel + 1
	
	if CurrentLevel <= #level then
		if level[CurrentLevel].healPlayer then healPlayer() end
		if level[CurrentLevel].bunker then startBunkers( level[CurrentLevel].bunkerLife ) end
		
		grantPlayer( level[CurrentLevel].grantLife, level[CurrentLevel].grantAtk )
	
		setPlayer( Screen.w/2 - player.w/2 , 350 )
		setZeroBullets()
		startLevel(CurrentLevel)
	end
	
end