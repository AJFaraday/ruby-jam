module Game
  class Panellist

    @@panellists = []

    attr_accessor :index
    attr_accessor :name1, :name2
    attr_accessor :font, :buzzer, :score, :challenger

    def self.[](index)
      @@panellists[index]
    end

    def initialize(window, index, config)
      @@panellists << self
      @window = window
      @index = index
      @challenger = false
      init_pad(index)
      init_name(config)
      init_score
      init_buzzer(config['buzzer'])
      center = (window.x_size / 2)
      gap = window.x_size / 4

      if @window.config.reverse
        # house left to house right
        display_index = ((@index - 3) * -1)
      else
        # stage left to stage right
        display_index = @index
      end
      @center = center + (gap * (display_index - 1.5))
    end

    def init_pad(index)
      @pad = RubyBuzz::Pad[index]
      @pad.add_event(
        :buzz,
        eval("lambda { Panellist[#{index}].buzz }")
      )
    end

    def init_score
      @score = 0
      @score_font = Gosu::Font.new(@window.x_size / 5)
    end

    def init_name(config)
      @name1 = config['name1']
      @name2 = config['name2']
      @name_font = Gosu::Font.new(@window.x_size / 15)
    end

    def init_buzzer(sample_name)
      @buzzer = Gosu::Sample.new(
        File.join(
          File.dirname(__FILE__),
          '..', '..', 'audio',
          sample_name
        )
      )
    end

    def colour
      if @challenger
        Gosu::Color::GREEN
      else
        Gosu::Color::WHITE
      end
    end

    def draw
      @name_font.draw_rel(
        name1,
        @center,
        (@window.y_size / 8) * 5,
        0, 0.5, 0.5,
        1, 1, colour
      )
      @name_font.draw_rel(
        name2,
        @center,
        (@window.y_size / 8) * 5.5,
        0, 0.5, 0.5,
        1, 1, colour
      )
      @score_font.draw_rel(
        score.to_s,
        @center,
        (@window.y_size / 8) * 7,
        0, 0.5, 0.5,
        1, 1, colour
      )
    end

    def button_down(id)
      case id
        when KeyBinding.panellist(@index, :up)
          @score += 1
          @window.report
        when KeyBinding.panellist(@index, :down)
          @score -= 1
          @window.report
        when KeyBinding.panellist(@index, :buzz)
          buzz
      end
    end

    def buzz
      if @window.timer.active
        @challenger = true
        @window.timer.stop
        @pad.light.on
        @buzzer.play
        @window.report
      end
    end

  end
end