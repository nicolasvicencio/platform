local SPEED = 100

local function newProjectile()
  local img = love.graphics.newImage('industrial.png')
  local q = love.graphics.newQuad(208, 256, 16, 16, img:getDimensions())
  local psys = love.graphics.newParticleSystem(img, 32)
  psys:setOffset(8, 8)
  psys:setQuads(q, q)
  psys:setSizes(0.6, 0.2)
  psys:setSpeed(-10, 10)
  psys:setParticleLifetime(.5, .5)
  psys:setRotation(0, 2*math.pi)
  psys:setSpread(2*math.pi)
  psys:setAreaSpread('normal', 1, 1)
  psys:setEmissionRate(30)

  return psys
end

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  c = love.graphics.newCanvas(300, 400)
  p = newProjectile()
  x, y = 50, 50
end

function love.draw()
  love.graphics.setCanvas(c)
  love.graphics.clear()
  love.graphics.draw(p)
  love.graphics.setCanvas()
  love.graphics.scale(2, 2)
  love.graphics.draw(c)
end

function love.update(dt)
  p:update(dt)
  p:moveTo(x, y)

  if love.keyboard.isDown('space') then
    p:setEmissionRate(0)
  else
    p:setEmissionRate(30)
    if love.keyboard.isDown('up') then    y = y - SPEED * dt end
    if love.keyboard.isDown('down') then  y = y + SPEED * dt end
    if love.keyboard.isDown('left') then  x = x - SPEED * dt end
    if love.keyboard.isDown('right') then x = x + SPEED * dt end
  end
end
