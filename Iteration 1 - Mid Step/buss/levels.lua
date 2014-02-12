level = {
			[1] = { totalLines = 1, 
					guyLine = { [1] = { nGuys = 5, typGuy = 1 }	} 
				  },
			[2] = { totalLines = 3,
					guyLine = {
								[1] = { nGuys = 7, typGuy = 3},
								[2] = { nGuys = 6, typGuy = 2},
								[3] = { nGuys = 5, typGuy = 1}
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
		for m = 1, nGuys do
				addGuy( (m - 1) * dist + dist/2 , (l - 1) * 50 + dist/2, dist - 10 ) 
		end
	end	
end