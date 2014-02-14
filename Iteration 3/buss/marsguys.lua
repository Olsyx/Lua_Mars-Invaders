
marsList = {}
marsRemoval = {}

function addGuy( x , y , t)
	local guy = {}
	
	guy.w = imageBank.mars.w
	guy.h = imageBank.mars.h
	
	guy.x = x
	guy.y = y
	
	guy.tGuy = t
	guy.vel = 5
	guy.life = 1
	
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
			addBullet( "mars", marsList[selectedGuy].x + imageBank.mars.w/2, marsList[selectedGuy].y + imageBank.mars.h, "1" )
		end
	
		temp.mBullet = 0
	end

end