module Game
  module Initialisers

    def init_config
      @config = Game::Config.new
    end

    def init_controller
      @controller = RubyBuzz::Device.new
      @controller.start_watching
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

    def init_subjects
      @subjects = Game::Subject.new(self, @config)
      @drawable_objects << @subjects
      @updatable_objects << @subjects
    end

    def init_reporters
      @reporters = []
      @config.reporters.each do |reporter|
        if reporter.delete('active')
          kls = Object.const_get(reporter.delete('class'))
          @reporters << kls.new(self, reporter)
        end
      end
      report
    end

  end
end