level = {
			[1] = { vel = 5, pxl = 1, maxShooters = 1, grantLife = 0, grantAtk = 0, healPlayer = false, 
					bunker = false, bunkerLife = nil, ovni = false,
					guyLines = { [1] = { nGuys = 5, typGuy = 1 },
								 [2] = { nGuys = 5, typGuy = 1 },
								 [3] = { nGuys = 5, typGuy = 1 },
							  },
				  },

			[2] = { vel = 4, pxl = 2, maxShooters = 5, grantLife = 0, grantAtk = 0, healPlayer = false, 
					bunker = false, bunkerLife = nil, ovni = true,
					guyLines = {
								[1] = { nGuys = 5, typGuy = 3 },
								[2] = { nGuys = 5, typGuy = 3 },
								[3] = { nGuys = 5, typGuy = 2 },
								[4] = { nGuys = 5, typGuy = 1 }
							  }
				  },
			[3] = { vel = 4, pxl = 3, maxShooters = 5, grantLife = 1, grantAtk = 1, healPlayer = false, 
					bunker = true, bunkerLife = 2, ovni = false,
					guyLines = {
								[1] = { nGuys = 7, typGuy = 3 },
								[2] = { nGuys = 7, typGuy = 3 },
								[3] = { nGuys = 7, typGuy = 3 },
								[4] = { nGuys = 6, typGuy = 2 },
								[5] = { nGuys = 6, typGuy = 2 },
								[6] = { nGuys = 5, typGuy = 1 }
							  }
				  },
		}