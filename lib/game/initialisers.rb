module Game
  module Initialisers

    def init_timer
      @timer = Timer.new(self)
      @updatable_objects << @timer
    end

    def init_theme
      @theme = Game::Theme.new(self)
      @updatable_objects << @theme
    end

  end
end