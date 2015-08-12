require 'gosu'
Dir.glob(File.join(File.dirname(__FILE__), '*.rb')).each do |file|
  require file
end
Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each do |file|
  require file
end

class Window < Gosu::Window

  attr_accessor :x_size, :y_size
  attr_accessor :timer

  include Game::Initialisers

  def initialize
    @x_size = 640
    @y_size = 480
    super @x_size, @y_size
    self.caption = "Ruby JAM"
    @updatable_objects = []
    init_timer
    init_theme
  end

  def update
    close_on_esc
    @updatable_objects.each{|ob|ob.update}
  end

  def draw
    timer.draw
  end

  def close_on_esc
    if button_down?(Gosu::KbEscape)
      close
    end
  end

end