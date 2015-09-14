require_relative './lib/window.rb'

#w= Window.new

#c = w.instance_variable_get :@controller
c = Game::Controller.new 'a'

d = c.instance_variable_get :@device
h = c.instance_variable_get :@handle

puts '-' * 100

# get configuration
x = h.control_transfer(
  :bmRequestType => "10000000".to_i(2),
  :bRequest => 8,
  :wValue => 0,
  :wIndex => 0,
  :dataIn => 1
) 
puts x.inspect

# set configuration
x = h.control_transfer(
  :bmRequestType => "00000000".to_i(2),
  :bRequest => 9,
  :wValue => 0,
  :wIndex => 0,
  :dataOut => "\x00"
) 
puts x.inspect

