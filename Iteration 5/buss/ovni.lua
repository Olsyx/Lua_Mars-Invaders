
ovni = {	
			life = 10, dmg = 5, tShots = 1.5,
			
			dimens = { w = nil, h = nil },
			
			mov = {	
					x = nil, y = nil,
					pxl = 5, vel = 10, 
					dir = 1,
				  },
			
			tGuy = 100,
			
			visible = nil
		}
		
function healOvni()

	ovni.life = 10
	ovni.visible = true

end

function startOvni()
	
	healOvni()

	ovni.mov.x = Screen.w/2
	ovni.mov.y = 10
	ovni.dimens.w = imageBank.ovni:getWidth()
	ovni.dimens.h = imageBank.ovni:getHeight()
end

function drawOvni()
	love.graphics.draw( imageBank.ovni , ovni.mov.x, ovni.mov.y )
end

function updateOvni( dt )
	moveOvni( dt )
	
	if ovni.visible and ovni.life <= 0 then
		ovni.visible = false
	elseif ovni.visible and temp.oBullet >= ovni.tShots then
		addBullet( "mars" , ovni.mov.x + ovni.dimens.w/2 , ovni.mov.y + ovni.dimens.h/2 , ovni.dmg , ovni.tGuy )
		temp.oBullet = 0
	end
	
end

function moveOvni( dt )
	ovni.mov.x = ovni.mov.x + ovni.mov.pxl*ovni.mov.vel*dt*ovni.mov.dir
	
	if ovni.mov.x + ovni.dimens.w <= 0 or ovni.mov.x >= Screen.w then
		ovni.mov.dir = -1*ovni.mov.dir
	end
end

