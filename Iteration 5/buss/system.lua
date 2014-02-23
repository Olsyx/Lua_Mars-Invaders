
temp = { mars = 0,
		 mBullet = 0,
		 pBullet = 0,
		 oBullet = 0,
		} 
		
playerPosY = 350

function loadTemps()
end

function updateTemps( dt )

	temp.mars = temp.mars + dt		-- + seconds
	temp.mBullet = temp.mBullet + dt
	temp.pBullet = temp.pBullet + dt
	temp.oBullet = temp.oBullet + dt
	
end