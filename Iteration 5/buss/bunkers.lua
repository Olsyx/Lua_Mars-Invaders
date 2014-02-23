
bunkers = { [1] = {}, [2] = {}, [3] = {}, [4] = {} }
bunkersLife = { [1] = {}, [2] = {}, [3] = {}, [4] = {} } 


bunkPieces = { w = nil, h = nil, dist = nil }

function startBunkers( life )

	for bk = 1, #bunkers do
		initiateBunker( bk , life )
	end

	bunkPieces.w = imageBank.bunkPiece:getWidth()
	bunkPieces.totalw = bunkPieces.w*#bunkers[1][1]
	bunkPieces.h = imageBank.bunkPiece:getHeight()
	bunkPieces.totalh = bunkPieces.h*#bunkers[1]
	
	bunkPieces.dist = (Screen.w/#bunkers) - bunkPieces.totalw
	bunkPieces.y = 290
	
end

function initiateBunker( index , life )
	bunkers[index] = {  { 0, 1, 0 },
						{ 1, 1, 1 },
						{ 1, 0, 1 }
					 }
	bunkersLife[index]  =  {  { 0, life, 0 },
							{ life, life, life },
							{ life, 0, life }
							}
end

function drawBunkers()
	
	local x 
	
	for ib = 1, #bunkers do
		x = (ib-1)*(bunkPieces.dist + bunkPieces.totalw) + bunkPieces.dist/2
		drawOneBunker( ib , x , bunkPieces.y )
	end
	
end

function drawOneBunker( index , x , y )
	for row = 1, #bunkers[index] do
		for col = 1, #bunkers[index][row] do
			if bunkers[index][row][col] == 1 then
				love.graphics.draw(imageBank.bunkPiece, x + (col-1)*bunkPieces.w, y + (row-1)*bunkPieces.h)
			end
		end
	end
end

function printBunkers( )
	for index = 1, #bunkers do
		for row = 1, #bunkers[index] do
			print(bunkers[index][row][1].." , "..bunkers[index][row][2].." , "..bunkers[index][row][3])
		end
		print()
	end
end


function checkCollisionBunker( bunkindex, bunkx, bunky, bmode, bindex, bx, by )

	local x, y, col, row, is_found

	row = 0
		
	while ( row < #bunkers[bunkindex] and not is_found ) do		
		row = row + 1	
		col = 0
		is_found = false

		
		while ( col < #bunkers[bunkindex][row] and not is_found ) do
			col = col + 1
			x = bunkx + (col-1)*bunkPieces.w
			y = bunky + (row-1)*bunkPieces.h
			is_found = insideBox( bx , by, x , y , bunkPieces.w , bunkPieces.h )


			if  is_found and bunkers[bunkindex][row][col] == 1 then
				if bunkersLife[bunkindex][row][col] > 0 then
							bunkersLife[bunkindex][row][col] = bunkersLife[bunkindex][row][col] - bts[bmode][bindex].dmg
				end
				if bunkersLife[bunkindex][row][col] <= 0 then
					
					bunkers[bunkindex][row][col] = 0
				end
				addBulletRemoval( bmode, bindex )		
			end
		end
	end
end

