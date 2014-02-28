
buttons = { 
			["menu"] = {},
			["game"] = {}
		  }
		
		
function addButton( where, x , y , w , h , stateTo )
	
	local button = {}
	
	button.x = x
	button.y = y
	button.w = w
	button.h = h
	button.stateTo = stateTo
	
	table.insert( buttons[where] ,  button )
	
end

function loadButtons()

	local start = 200
	
	addButton( "menu", 78 ,  start + 50, imageBank.buttons["InsertCoinOn"]:getWidth() , imageBank.buttons["InsertCoinOn"]:getHeight() , "InsertCoin" )
	addButton( "menu", 78 ,  start + 125, imageBank.buttons["GameOn"]:getWidth() , imageBank.buttons["GameOn"]:getHeight() , "Game" )
	addButton( "menu", 118 , start + 200, imageBank.buttons["ExitOn"]:getWidth() , imageBank.buttons["ExitOn"]:getHeight() , "Exit" )
	addButton( "game", 20 , 410 , imageBank.buttons["MenuOn"]:getWidth() , imageBank.buttons["MenuOn"]:getHeight()  , "Menu" )
end

function updateMenu( dt )

end

function buttonPressed( button , Mx , My )

	local pressed
	
	if button == 'l' then
		if State == "Menu" then
			pressed = whichButtonPressed( "menu" , Mx , My )
			
			if pressed == "InsertCoin" then
				if MenuCoins < 5 then
					MenuCoins = MenuCoins + 1
				end
			elseif pressed == "Game" then
				if MenuCoins > 0 then
					startPlayer( Screen.w/2 - imageBank.player:getWidth()/2 , playerPosY )
					MenuCoins = 0
					firstLevel()
					State = "Game"
				end
			elseif pressed == "Exit" then
			  love.event.push("quit")
			end			
			
		elseif State == "Game" then
			pressed = whichButtonPressed( "game" , Mx , My )
			if pressed == "Menu" then
				State = "Menu"
			end
		end
	end

end

function whichButtonPressed( where , Mx , My )
	for btt = 1, #buttons[where] do
		if insideBox( Mx, My, buttons[where][btt].x, buttons[where][btt].y, buttons[where][btt].w, buttons[where][btt].h ) then
			return buttons[where][btt].stateTo
		end
	end
	
	return nil
	
end

function drawWhereButtons( where, Mx , My )
	for btt = 1, #buttons[where] do
		drawButton( buttons[where][btt], Mx, My )
	end
end

function drawButton( btt, Mx, My )

	if insideBox( Mx, My, btt.x, btt.y, btt.w, btt.h ) then
		love.graphics.draw( imageBank.buttons[btt.stateTo.."On"] , btt.x, btt.y )
	else
		love.graphics.draw( imageBank.buttons[btt.stateTo.."Off"] , btt.x, btt.y )
	end
end