function onCreate()
      makeLuaSprite('bg', 'Background/Underwater_bg', -500, 150)
	  addLuaSprite('bg', false)
	  scaleObject('bg', 2.45, 2)
	  
	  makeAnimatedLuaSprite('bb1', 'Background/Bubble', -100, 700)
	  addAnimationByPrefix('bb1', 'SideToSide','moving', 24, true)
	  addLuaSprite('bb1', false)
	  scaleObject('bb1', 0.4, 0.4)
	  objectPlayAnimation('bb1', 'SideToSide', true)
	  
	  makeAnimatedLuaSprite('bb2', 'Background/Bubble', 1000, 600)
	  addAnimationByPrefix('bb2', 'SideToSide','moving', 32, true)
	  addLuaSprite('bb2', false)
	  scaleObject('bb2', 0.2, 0.2)
	  objectPlayAnimation('bb2', 'SideToSide', true)

	  makeAnimatedLuaSprite('bb3', 'Background/Bubble', 450, 800)
	  addAnimationByPrefix('bb3', 'SideToSide','moving', 16, true)
	  addLuaSprite('bb3', true)
	  scaleObject('bb3', 0.75, 0.75)
	  objectPlayAnimation('bb3', 'SideToSide', true)	  
end

function onUpdate()
end

function onTimerCompleted(tag, loops, loopsLeft)
end