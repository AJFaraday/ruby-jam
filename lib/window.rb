require 'gosu'
require 'yaml'
Dir.glob(File.join(File.dirname(__FILE__), '*.rb')).each do |file|
  require file
end
Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each do |file|
  require file
end
Dir.glob(File.join(File.dirname(__FILE__), '..', 'config', '*.rb')).each do |file|
  require file
end


class Window < Gosu::Window

  attr_accessor :x_size, :y_size
  attr_accessor :timer
  attr_accessor :panellists

  include Game::Initialisers

  def initialize
    @x_size = 640
    @y_size = 480
    super @x_size, @y_size
    self.caption = "Ruby JAM"
    @updatable_objects = []
    @drawable_objects = []
    init_timer
    init_theme
    init_panellists
  end

  def update
    @updatable_objects.each{|ob|ob.update if ob.respond_to?(:update)}
  end

  def button_down(id)
    @updatable_objects.each do |ob|
      ob.button_down(id) if ob.respond_to?(:button_down)
    end
    if id == KeyBinding[:close]
      close
    end
  end

  def draw
    @drawable_objects.each{|ob| ob.draw}
  end

end