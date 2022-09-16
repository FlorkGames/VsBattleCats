local canAttack = true
local Hwalk = false
local HKB = 0
local Swalk = false
local SKB = 0
local Sattacked = 0

function onSongStart()
   noteTweenAlpha('nonote1', 0, 0, 1, 'cubeInOut')
   noteTweenAlpha('nonote2', 1, 0, 1, 'cubeInOut')
   noteTweenAlpha('nonote3', 2, 0, 1, 'cubeInOut')
   noteTweenAlpha('nonote4', 3, 0, 1, 'cubeInOut')

   runTimer('Hippwalk', getRandomInt(1, 32), 1)
   runTimer('Saewalk', getRandomInt(4, 36), 1)   
end


function onCreate()
      makeAnimatedLuaSprite('hippo', 'characters/Hippo_Alien', -600, 600)
	  addAnimationByPrefix('hippo', 'Idle','Idle', 1, true)
	  addAnimationByPrefix('hippo', 'Walk','Walk', 8, true)
	  addAnimationByPrefix('hippo', 'Attack','Attack', 8, false)
      addLuaSprite('hippo', true)
	  scaleObject('hippo', 3.5, 3.5)

      makeAnimatedLuaSprite('sae', 'characters/Sael_Alien', -640, 700)
	  addAnimationByPrefix('sae', 'Idle','Idle', 1, true)
	  addAnimationByPrefix('sae', 'Walk','Walk', 8, true)
	  addAnimationByPrefix('sae', 'Attack','Attack', 8, false)
      addLuaSprite('sae', true)
	  scaleObject('sae', 3.2, 3.2)	  
end

function onUpdate()
  if Hwalk == false then
  elseif Hwalk == true then
     setProperty('hippo.x', getProperty('hippo.x')+ 2)
     objectPlayAnimation('hippo', 'Walk', false)	 
  end

  if getProperty('hippo.x') > getProperty('boyfriend.x')- 345 and Hwalk == true then
     Hwalk = false
     objectPlayAnimation('hippo', 'Idle', false)		 
	 runTimer('Hippattack', 2, 1)
  end
  
  if Hattack == true then
     Hattack = false
     	objectPlayAnimation('hippo', 'Attack', false)
	      if getProperty('hippo.animation.curAnim.finished') and getProperty('hippo.animation.curAnim.name') == 'Attack' and Hattack == true then
		    setProperty('healthBar.percent', getProperty('healthBar.percent')- 0.5)		
		     	objectPlayAnimation('hippo', 'Idle', false)	
			    runTimer('Hippattack', 2, 1)
		  end
  end
  
 	 if getProperty('hippo.animation.curAnim.finished') and getProperty('hippo.animation.curAnim.name') == 'Attack' then		
		 setProperty('health', getProperty('health')- 0.5)	 
		 characterPlayAnim('boyfriend', 'hurt', 24, false)	
		 objectPlayAnimation('hippo', 'Idle', false)			  
         runTimer('Hippattack', 1, 1)	
         playSound('attack', 1, 1)		 
	 end 
	
    if Hknockback == true then
       cancelTimer('Hippattack')
       setProperty('hippo.x', getProperty('hippo.x')- 12)	
       objectPlayAnimation('hippo', 'Idle', false)	   
	   setProperty('hippo.angle', -25)		    
       if Hknockback == true and getProperty('hippo.x') < -600 then
         Hknockback = false	
		 Hwalk = true
		 setProperty('hippo.angle', 0)
       end	
    end
	
	  if getProperty('hippo.y') == 500 then
	     doTweenY('hipk', 'hippo', 600, 0.6, 'bounceOut')	 
	  end
	
	if HKB == 2 then
	   Hwalk = false
	   Hknockback = false
	   HKB = 0
	   setProperty('hippo.x', -600)
	   setProperty('hippo.angle', 0)	   
	   playSound('dead', 1, 1)	   
	   runTimer('Hippwalk', getRandomInt(1,32), 1)
	end
	
  if Swalk == false then
  elseif Swalk == true then
     setProperty('sae.x', getProperty('sae.x')+ 1)
     objectPlayAnimation('sae', 'Walk', false)	 
  end

  if getProperty('sae.x') > getProperty('boyfriend.x')- 385 and Swalk == true then
     Swalk = false
     objectPlayAnimation('sae', 'Idle', false)		 
	 runTimer('Saeattack', 5, 1)
  end  
  
  	 if getProperty('sae.animation.curAnim.finished') and getProperty('sae.animation.curAnim.name') == 'Attack' then		
		 setProperty('health', getProperty('health')- 1)	 
		 characterPlayAnim('boyfriend', 'hurt', 24, false)	
		 objectPlayAnimation('sae', 'Idle', false)			 
         triggerEvent('Change Scroll Speed', 0.5, 0.5)	
         runTimer('SaeabilityEnd', 4, 1)			 
         runTimer('Saeattack', 5, 1)	
         playSound('attack', 1, 1)		 
	 end  
	 
    if Sknockback == true then
       cancelTimer('Saeattack')
       setProperty('sae.x', getProperty('sae.x')- 12)	
       objectPlayAnimation('sae', 'Idle', false)	   
	   setProperty('sae.angle', -25)		     	   
       if Sknockback == true and getProperty('sae.x') < -640 then
         Sknockback = false	
		 Swalk = true
		 setProperty('sae.angle', 0)
       end	
    end
	
	  if getProperty('sae.y') == 600 then
	     doTweenY('saeDOWN', 'sae', 700, 0.6, 'bounceOut')	 
	  end		  
	  
	if Sattacked == 2 then
	  runTimer('Skb', 0.75, 1)
      Sknockback = true	
	  Sattacked = 0
      doTweenY('saeUP', 'sae', 600, 0.35, 'cubeOut')		  
	end 
	
	if SKB == 2 then
	   Swalk = false
	   Sknockback = false
	   SKB = 0
       objectPlayAnimation('sae', 'Idle', false)	   
	   setProperty('sae.x', -640)
	   setProperty('sae.angle', 0)	   
	   playSound('dead', 1, 1)	   
	   runTimer('Saewalk', getRandomInt(4,36), 1)
	end	  	
	  
	
  if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
     doTweenZoom('cam', 'camGame', 0.85, 2.5, 'cubeInOut')
  end	
  if getPropertyFromClass('flixel.FlxG', 'keys.pressed.CONTROL') then
     doTweenZoom('cam', 'camGame', 0.95, 2.5, 'cubeInOut')
  end	  
	   
  if canAttack == true and getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') then
     characterPlayAnim('boyfriend', 'attack', 16, true)
	 CD = 220
  end
  
  if canAttack == true and getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') and getProperty('hippo.x') > getProperty('boyfriend.x')- 385 then
     characterPlayAnim('boyfriend', 'attack', 16, true)
	 playSound('bfattack', 1, 1)
     doTweenY('hipb', 'hippo', 500, 0.35, 'cubeOut')	 	 
	 Hknockback = true 
	 runTimer('Hkb', 0.75, 1)
	 CD = 220
  end 
  
  if canAttack == true and getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') and getProperty('sae.x') > getProperty('boyfriend.x')- 385 then
     characterPlayAnim('boyfriend', 'attack', 16, true)
	 playSound('bfattack', 1, 1)	 
	 runTimer('Saeattacked', 0.1, 1)
	 CD = 220
  end   
  
  if CD > 0 then
    CD = CD - 1
	canAttack = false
  end
  
  if CD == 0 then
    CD = CD - 0
	canAttack = true
  end	 
end


function onTimerCompleted(tag, loops, loopsLeft)
       --Hippo Alien Timers--
     if tag == 'Hippwalk' then
	    Hwalk = true
	 end	
	 if tag == 'Hippattack' then
     	objectPlayAnimation('hippo', 'Attack', false)				
	 end
	 if tag == 'Hkb' then
     	HKB = HKB + 1		
	 end	 
       --Sael Alien Timers--	 
     if tag == 'Saewalk' then
	    Swalk = true
	 end	
	 if tag == 'Saeattack' then
     	objectPlayAnimation('sae', 'Attack', false)				
	 end
	 if tag == 'Skb' then
     	SKB = SKB + 1		
	 end	 
	 if tag == 'Saeattacked' then
	    Sattacked = Sattacked + 1	 
	 end
     if tag == 'SaeabilityEnd' then
        triggerEvent('Change Scroll Speed', 1, 4)	
     end		 
end