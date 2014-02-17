bts = { ["mars"] = {},
		["player"] = {}
	  }

bType = { ["1"] = {
					vel = 2,
					damage = 0.5,
					} 
		}
		
bRemoval = {  	["mars"] = {},
				["player"] = {},
			}
 
function addBullet( identityChar , x , y , atk , bType , tGuy )

	local bt = {}
	
	bt.x = x
	bt.y = y
	
	bt.w = 4
	bt.h = 8
	
	bt.vel = 2
	bt.dmg = atk
	bt.tGuy = tGuy
	
	bts[identityChar][#bts[identityChar] + 1] = bt
	
end

function updateBullets()
	moveBullets()
	
	checkBulletCollisionPlayer()
	checkBulletCollisionMars()
	
	if level[CurrentLevel].bunker then
		checkBulletCollisionBunkers( "player" )
		checkBulletCollisionBunkers( "mars" )
	end
	
	removeBullets("mars")
	removeBullets("player")
end

function moveBullets()
	for b = 1, #bts["mars"] do
		bts["mars"][b].y = bts["mars"][b].y + 1
		if bts["mars"][b].y +  bts["mars"][b].h == Screen.downLimit then 
			addBulletRemoval( "mars", b )
		end
	end

	for b = 1, #bts["player"] do
		bts["player"][b].y = bts["player"][b].y - 1
		if bts["player"][b].y == 0 then 
			addBulletRemoval( "player", b )
		end
	end
	
end

function removeBullets( mode )
	for r = #bRemoval[mode], 1, -1 do
		table.remove( bts[mode], bRemoval[mode][r] )
	end
	bRemoval[mode] = {}
end

function checkBulletCollisionPlayer()
	local m
	for b = 1, #bts["player"] do
		m = 1
		while ( m <= #marsList and not insideBox( bts["player"][b].x, bts["player"][b].y, marsList[m].x, marsList[m].y, marsList[m].w, marsList[m].h) ) do
				m = m + 1
		end
			
		if  m <= #marsList then
			marsList[m].life = marsList[m].life - bts["player"][b].dmg
			player.score = player.score + marsTypes[ marsList[m].tGuy ].scoreHit
			addBulletRemoval( "player", b )	
			if marsList[m].life <= 0 then
				player.score = player.score + marsTypes[ marsList[m].tGuy ].scoreKilled
				addMarsToRemoval(m)
			end		
		end	
	end
end

function checkBulletCollisionMars()
	for b = 1, #bts["mars"] do
		if insideBox( bts["mars"][b].x, bts["mars"][b].y, player.mov.x, player.mov.y, player.w, player.h ) then
			player.life = player.life - bts["mars"][b].dmg
			player.score = player.score - marsTypes[ bts["mars"][b].tGuy ].subsScore
			addBulletRemoval( "mars", b ) 
		end
	end
end

function checkBulletCollisionBunkers( mode )
	
	local bunkx, bx, by
	
	for b = 1, #bts[mode] do
	
		bnk = 0
		is_found = false
		bx = bts[mode][b].x
		by = bts[mode][b].y
		
		while ( bnk < #bunkers and not is_found ) do
			bnk = bnk + 1
			bunkx = (bnk-1)*(bunkPieces.dist + bunkPieces.totalw) + bunkPieces.dist/2
			bunky = bunkPieces.y
			
			if mode == "mars" then	by = by + bts[mode][b].h/2 end

			is_found = insideBox( bx, by, bunkx, bunky, bunkPieces.totalw, bunkPieces.totalh )
			
			if  is_found then
				checkCollisionBunker( bnk, bunkx, bunky, mode, b, bx, by )					
			end -- bnk
		end
		
	end -- #bts[mode]


end

function setZeroBullets()
	bts["mars"] = {}
	bts["player"] = {}
end

function addBulletRemoval( mode, index )
	table.insert(bRemoval[mode], index)
end