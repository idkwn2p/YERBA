-- Make StateMachine a class
StateMachine = Object:extend()

function StateMachine:new(states)
  self.empty = {
    render = function() end,
    update = function() end,
    exit = function() end
  }
  self.states = states or {}
  self.current = self.empty
end

-- Change state
function StateMachine:change(newState)
  assert(self.states[newState])
  self.current:exit()
  self.current = self.states[newState]()
end

-- Execute update functions
function StateMachine:update(dt)
  self.current:update(dt)
end

-- Execute render functions
function StateMachine:render()
  self.current:render()
end