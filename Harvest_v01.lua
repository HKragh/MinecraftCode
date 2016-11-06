local c = peripheral.wrap("left")
local axisCount = 7
local harvestPause = 30
local iAxisMod = 0
local jAxisMod = 0

function Refuel ()
	turtle.select(16)

	if not turtle.refuel(math.round(((axisCount*axisCount)*2*2+100)/80)) then
		print("Find fuel station")
		FindFuelStation()
	end
	print("Succesfully fueled!")
end

function FindFuelStation ()

end

function moveBack(amount)
  for i = 1, amount do
    while not turtle.back() do
      os.sleep(1)      
    end
  end
end

function moveForward(amount)
  for i = 1, amount do
    while not turtle.forward() do
      os.sleep(1)
    end
  end
end

function moveToPickupStart()

  moveBack(axisCount)
  turtle.turnRight()
  moveForward(axisCount)
  turtle.turnLeft()
end

function moveToHarvestStart()

  moveBack(axisCount)
  turtle.turnRight()
  moveForward(axisCount-1)
  turtle.turnLeft()
end

function harvestMove()

	for i = 1, axisCount+1 do
  
	  if ((iAxisMod == 0) and (i<axisCount+1)) or (iAxisMod == 1) then

	   for j = 1, axisCount do
		
		if (iAxisMod == 1) and (j == 1) then
			turtle.suckDown()
		end
      
		  if ((i == 4+iAxisMod) and (j < axisCount)) or (i ~= 4+iAxisMod) then
      
			if (i == 4+iAxisMod) and (j == 4) then
			  turtle.turnRight()
			  moveForward(1)
			  turtle.turnLeft()
			  moveForward(2)
			  turtle.turnLeft()
			  moveForward(1)
			  turtle.turnRight()
      
			else
			  moveForward(1)       
			end
			if iAxisMod == 0 then
				c.clickDown()
			elseif iAxisMod == 1 then
				turtle.suckDown()

			end
			
		  end
                  
	   end
   
	   if i == 4+iAxisMod then
		 turtle.turnLeft()
		 moveForward(1)
		 turtle.turnRight()
   
		 moveBack(axisCount)
	   else
   
		 if i ~= axisCount+iAxisMod then   
		   
		   moveBack(axisCount)
          
		   turtle.turnLeft()
		   moveForward(1)
		   turtle.turnRight()
		 else
			if iAxisMod == 0 then        
			  moveToPickupStart()  
			  do return end
			elseif iAxisMod == 1 then
				moveToHarvestStart()  
				do return end
			end     
		 end
	   end
	   --Loop End
	   end
	end

end

while true do
	if turtle.getFuelLevel() < (axisCount*axisCount)*2*2+100 then 
		Refuel()
	end
	harvestMove()
	iAxisMod = 1 
	harvestMove()

	for i = 1, 15 do
	turtle.select(i)
	turtle.dropDown()  
	end
	if turtle.getFuelLevel() < (axisCount*axisCount)*2*2+100 then 
		Refuel()
	else
	
		sleep(harvestPause)
	end
	iAxisMod = 0 

end



