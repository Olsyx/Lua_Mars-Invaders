bts = { ["mars"] = {},
		["player"] = {}
	  }

bType = { ["1"] = {
					vel = 2,
					damage = 0.5,
					} 
		}
		
bRemovalm = {}
bRemovalp = {}
 
function addBullet( identityChar , x , y , bType )

	local bt = {}
	
	bt.x = x
	bt.y = y
	bt.vel = 2
	bt.dmg = 0.5
	
	bts[identityChar][#bts[identityChar] + 1] = bt
	
end

function updateBullets()

	for b = 1, #bts["mars"] do
		bts["mars"][b].y = bts["mars"][b].y + 1
		if bts["mars"][b].y == Screen.h then 
			table.insert(bRemovalm, b) 
		end
	end

	for b = 1, #bts["player"] do
		bts["player"][b].y = bts["player"][b].y - 1
		if bts["player"][b].y == 0 then 
			table.insert(bRemovalp, b) 
		end
	end
	
	for r = #bRemovalm, 1, -1 do
		table.remove( bts["mars"], bRemovalm[r] )
	end
	
	for r = #bRemovalp, 1, -1 do
		table.remove( bts["player"], bRemovalp[r] )	
	end
	
	bRemovalm = {}
	bRemovalp = {}

end