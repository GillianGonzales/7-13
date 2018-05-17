-----------------------------------------------------------------------------------------
--
-- scene1.lua
--
-- Created By Gillian Gonzales	
-- Created On May 15 2018
--
-- This file will show a level
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 	local physics = require( "physics" )

	physics.start()
	physics.setGravity(0, 50)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

            local background = display.newRect( 1024, 768, 2048, 1536 )
			background:setFillColor( 0,0.5,0.5 )
			background.id = "background"
			sceneGroup:insert(background)

 			local ground1 = display.newImage("./assets/sprites/land1.png")
				ground1.x = display.contentCenterX - 510
				ground1.y = display.contentHeight - 50
				ground1.id = "ground1"
				physics.addBody( ground1, "static", { 
    			friction = 0.5, 
    			bounce = 0.3 
    			} )

			local ground2 = display.newImage("./assets/sprites/land2.png")
				ground2.x = display.contentCenterX + 510
				ground2.y = display.contentHeight - 50
				ground2.id = "ground2"
				physics.addBody( ground2, "static", { 
    			friction = 0.5, 
    			bounce = 0.3 
    			} )

    		local badCharacter = display.newImage( "./assets/sprites/enemy.png" )
				badCharacter.x = 1520
				badCharacter.y = display.contentHeight - 1000
				badCharacter.id = "bad character"
				physics.addBody( badCharacter, "dynamic", { 
    			friction = 0.5, 
    			bounce = 0.3 
    			} )
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene