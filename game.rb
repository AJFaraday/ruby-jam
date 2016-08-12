require_relative 'lib/window'

restore = ARGV[0] != 'r'

window = Window.new(restore)
window.show