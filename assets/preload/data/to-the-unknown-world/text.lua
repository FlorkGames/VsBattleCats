function onCreate()
   makeLuaText('tip', 'Press Spacebar to attack, but dont forget that there is a cooldown', 650, 300, 150)
   setTextSize('tip', '35')
   addLuaText('tip', true)
   setProperty('tip.alpha', 1)
end   
function onUpdate()
   if curStep == 16 then
      doTweenAlpha('bye', 'tip', 0, 0.5, 'linear')   
   end  
end