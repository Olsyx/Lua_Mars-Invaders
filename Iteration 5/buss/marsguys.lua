
marsList = {}
marsRemoval = {}

marsTypes = {}
marsTypes[1] = { life = 2, dmg = 0.5 , scoreKilled = 5  , scoreHit =  1 , subsScore = 2 , r = 247 , g = 157 , b = 23}
marsTypes[2] = { life = 3, dmg = 1 , scoreKilled = 10 , scoreHit =  2 , subsScore = 4 , r = 22 , g = 45 , b = 248 }
marsTypes[3] = { life = 4, dmg = 1.5 , scoreKilled = 15 , scoreHit =  3 , subsScore = 6 , r = 185 , g = 243 , b = 105 }
marsTypes[100] = { life = 10, dmg = 5 , scoreKilled = 100 , scoreHit =  10 , subsScore = 100 , r = 47 , g = 121 , b = 99 }




function addGuy( x , y , t )
	local guy = {}
	
	guy.w = imageBank.mars[t]:getWidth()
	guy.h = imageBank.mars[t]:getHeight()
	
	guy.x = x
	guy.y = y
	
	guy.tGuy = t
	guy.life = marsTypes[t].life
	
	marsList[#marsList + 1] = guy
end

function updateMarsGuys( dt )
	shotsMarsGuys()
	moveMarsGuys( dt )
	removeTheDeadMarsGuys()
end

function removeTheDeadMarsGuys()
	for m = #marsRemoval, 1, -1 do
		table.remove( marsList, marsRemoval[m] )
	end
	marsRemoval = {}
end

function addMarsToRemoval( index )
	table.insert(marsRemoval, index)
end

function moveMarsGuys( dt )

	if temp.mars >= level[CurrentLevel].vel then
		
		for m = 1, #marsList do
			marsList[m].x = marsList[m].x - level[CurrentLevel].pxl
			marsList[m].y = marsList[m].y + level[CurrentLevel].pxl
		end
		
		temp.mars = 0
		
	elseif CurrentLevel >= 1 and CurrentLevel <= #level then
		
		for m = 1, #marsList do
			marsList[m].x = marsList[m].x + ((level[CurrentLevel].pxl*dt)/level[CurrentLevel].vel)
		end
		
	end
	
end

function shotsMarsGuys()

	if #marsList > 0 and temp.mBullet >= level[CurrentLevel].vel/2 then	
		local numMars = math.floor( love.math.random( 1, level[CurrentLevel].maxShooters ) )
		local selectedGuy
		
		for i = 1, numMars do
			selectedGuy = math.floor( love.math.random( 1, #marsList) )		
			addBullet( "mars", marsList[selectedGuy].x + marsList[selectedGuy].w/2, marsList[selectedGuy].y + marsList[selectedGuy].h, 
						marsTypes[marsList[selectedGuy].tGuy].dmg , marsList[selectedGuy].tGuy )
		end
	
		temp.mBullet = 0
	end

end

function checkMarsGuysReachLimit()
	for m = 1, #marsList do
		if marsList[m].y + marsList[m].h >= playerPosY then return true end	
	end
end