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

  def button_down(id)
    @updatable_objects.each do |ob|
      ob.button_down(id) if ob.respond_to?(:button_down)
    end
    if id == Gosu::KbEscape
      close
    end
  end

  def draw
    timer.draw
  end

end