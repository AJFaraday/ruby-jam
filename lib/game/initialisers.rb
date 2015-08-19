module Game
  module Initialisers

    def init_controller
      @controller = Game::Controller.new(self)
      @updatable_objects << @controller
    end

    def init_timer
      @timer = Timer.new(self)
      @updatable_objects << @timer
      @drawable_objects << @timer
    end

    def init_theme
      @theme = Game::Theme.new(self)
      @updatable_objects << @theme
    end

    def init_panellists
      @panellists = []
      config = YAML.load_file(
        File.join(
          File.dirname(__FILE__),
          '..', '..', 'config',
          'panellists.yml'
        )
      )
      config.each_with_index do |panellist_config, index|
        panellist = Game::Panellist.new(
          self,
          index,
          panellist_config
        )
        @panellists << panellist
        @drawable_objects << panellist
        @updatable_objects << panellist
      end
    end

  end
end