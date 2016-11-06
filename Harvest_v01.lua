local c = peripheral.wrap("left")
local axisCount = 7

local iAxisMod = 0
local jAxisMod = 0

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
  iAxisMod = 1  

end

function harvestMove()

for i = 1, axisCount+1 do
  
  if ((iAxisMod == 0) and (i<axisMod)) or (iAxisMod == 1) then

   for j = 1, axisCount do
   
   
      
      if ((i == 4) and (j < axisCount)) or (i ~= 4) then
      
        if (i == 4) and (j == 4) then
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
        --c.clickDown()
        
      end
                  
   end
   
   if i == 4 then
     axisSubtract = 0
   end   
   
   if i == 4 then
     turtle.turnLeft()
     moveForward(1)
     turtle.turnRight()
   
     for k = 1, axisCount do
     
       turtle.back()  
     end
   else
   
     if i ~= axisCount then   
       for k = 1, axisCount do
   
          turtle.back()
   
       end
          
       turtle.turnLeft()
       moveForward(1)
       turtle.turnRight()
     else
        if iAxisMod == 0 then        
          moveToPickupStart()  
        end     
     end
   end
   --Loop End
   end
end

end

harvestMove()