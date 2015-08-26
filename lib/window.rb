require 'gosu'
require 'yaml'
require 'libusb'

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
  attr_accessor :config

  include Game::Initialisers

  def initialize
    init_config
    @x_size = @config.x_size
    @y_size = @config.y_size
    super @x_size, @y_size, fullscreen: @config.full_screen
    self.caption = "Ruby JAM"
    @updatable_objects = []
    @drawable_objects = []
    init_timer
    init_theme
    init_panellists
    init_controller
  end

  def update
    @updatable_objects.each { |ob| ob.update if ob.respond_to?(:update) }
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
    @drawable_objects.each { |ob| ob.draw }
  end

end