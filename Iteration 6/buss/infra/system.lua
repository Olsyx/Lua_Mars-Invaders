
State = "Menu"
MenuCoins = 0

temp = { 
			mars = 0,
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

function setTempsZero()
	temp.mars = 0
	temp.mBullet = 0
	temp.pBullet = 0
	temp.oBullet = 0
end

function updateGame( dt )

	updateTemps(dt)
	
	if player.life <= 0 and player.tries >= 0 then
		player.tries = player.tries - 1
		setZeroBullets()
		marsList = {}
		startLevel( CurrentLevel )
		if level[CurrentLevel].ovni then healOvni() end
		healPlayer()
	elseif #marsList == 0 and not ovni.visible and CurrentLevel <= #level then
		nextLevel()
		love.timer.sleep(1)	
	elseif CurrentLevel <= #level and not checkMarsGuysReachLimit() and player.life > 0 then
		movePlayer()
		if level[CurrentLevel].ovni then	updateOvni(dt)	end
		updateMarsGuys(dt)
		updateBullets()		
	elseif checkMarsGuysReachLimit() then
		player.life = 0
	end

end

function uploadMenu( dt )


end