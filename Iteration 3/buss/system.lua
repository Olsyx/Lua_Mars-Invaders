
temp = { mars = 0,
		 mBullet = 0,
		} 

function loadTemps()
end

function updateTemps( dt )

	temp.mars = temp.mars + dt		-- + seconds
	temp.mBullet = temp.mBullet + dt
	
end