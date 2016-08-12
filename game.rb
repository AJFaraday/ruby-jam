require_relative 'lib/window'

puts 'Type anything to start with an empty game'
restore = gets.strip.length == 0

window = Window.new(restore)
window.show