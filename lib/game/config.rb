module Game

  class Config

    attr_accessor :raw_config
    attr_accessor :window_config

    def initialize
      @raw_config = YAML.load_file(
        File.join(File.dirname(__FILE__), '..', '..', 'config', 'config.yml')
      )
      window_config = YAML.load_file(
        File.join(File.dirname(__FILE__), '..', '..', 'config', 'window.yml')
      )
      @window_config = window_config[@raw_config["window_type"]]
    end

    def x_size
      @window_config['x_size']
    end

    def y_size
      @window_config['y_size']
    end

    def full_screen
      @window_config['full_screen']
    end

    def topics
      @raw_config['topics']
    end

    def reporters
      @raw_config['reporters']
    end

    def reverse
      @raw_config['reverse']
    end

  end

end