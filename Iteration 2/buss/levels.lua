level = {
			[1] = { totalLines = 1, 
					guyLine = { [1] = { nGuys = 5, typGuy = 1 }	} 
				  },
			[2] = { totalLines = 3,
					guyLine = {
								[1] = { nGuys = 7, typGuy = 3 },
								[2] = { nGuys = 6, typGuy = 2 },
								[3] = { nGuys = 5, typGuy = 1 }
							  }
				  },


		}
		
CurrentLevel = 1

function startLevel( numlevel )
	local totalLines = level[numlevel].totalLines
	local nGuys, dist
	
	for l = 1, totalLines do
		nGuys = level[numlevel].guyLine[l].nGuys
		dist = Screen.w/nGuys
		dGuys = (dist - imageBank.mars.w)/2
		for m = 1, nGuys do
			addGuy( (m-1)*dist + dGuys, (l - 1) * 40, level[numlevel].guyLine[l].typGuy ) 
		end
	end	
end