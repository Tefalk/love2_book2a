local Quad = love.graphics.newQuad

function love.load()

	sprite = love.graphics.newImage "sprite.png"

	character= {}
	character.player = love.graphics.newImage "sprite.png"
	character.x = 50
	character.y = 50
	direction = "right"
	iteration = 1

	max = 8

	idle = true
	timer = 0.1
		quads = {}
		quads['right'] = {}
		quads['left'] = {}
		for j=1,8 do 
			quads['right'][j] = Quad((j-1)*32, 0, 32, 32, 256, 32);
			quads['left'][j] = Quad((j-1)*32, 0, 32, 32, 256, 32);
	-- for the character to face the opposite direction, the quad needs to be flipped by using the 
	-- Quad:flip(x, y) method, where x and y are boolean
			-- quads.left[j]:flip(true, false)  -- flip horizontally x = true, y = false
		end
end

function love.update(dt)
	if idle == false then

		timer = timer + dt
		if timer > 0.2 then 
			timer = 0.1
	-- The animation will play as the iteration increases, so we just write iteration = iteration + 1,
	-- also we'll stop reset our iteration at the maximum of 8 with a timer updateto keep it smooth
			iteration = iteration + 1
			if love.keyboard.isDown('right') then 
				sprite.x = sprite.x + 5
			end
			if love.keyboard.isDown('left') then 
				sprite.x = sprite.x - 5
			end
			if iteration > max then 
				iteration = 1
			end
		end
	end
end

function love.keypressed(key)

	if quads[key] then
		direction = key
		idle = false
	end
end

function love.keyreleased(key)

	if quads[key] and direction == key then

		idle = true 

		iteration = 1

		direction = "right"

	end
end

function love.draw()

	love.graphics.drawq(character.player, quads[direction][iteration], sprite.x, sprite.y)

end
	
