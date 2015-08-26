module Game

  class Subject

    def initialize(window, config)
      file = File.open(
        File.join(File.dirname(__FILE__),
                  '..', '..', 'topics',
                  "#{config.topics}.txt"
        )
      )
      @subjects = []
      file.each_line { |l| @subjects << l.strip }
      @cursor = 0
      @window = window
      @font = Gosu::Font.new(@window.x_size / 3)
      @x_pos = @window.x_size / 2
      @y_pos = (@window.y_size / 6)
      @scale = 1
      change_scale
    end

    def current
      @subjects[@cursor]
    end

    def next
      target = @subjects[@cursor + 1]
      if target
        @subjects[@cursor += 1]
      else
        puts "Final topic reached"
        current
      end
    end

    def previous
      target = @cursor - 1
      if target >= 0
        @subjects[@cursor -= 1]
      else
        puts "First topic reached"
        current
      end
    end

    def draw
      @font.draw_rel(
        current, @x_pos, @y_pos,
        0, 0.5, 0.5, @scale, @scale
      )
    end

    def change_scale
      x_size = @font.text_width(current, scale_x = @scale)
      y_size = @font.height * @scale
      if x_size < (@window.x_size / 100) * 80
        # increase size
        @scale += 0.01
        change_scale
      elsif x_size > (@window.x_size / 100) * 85
        # shrink
        @scale -= 0.01
        change_scale
      end
    end

    def button_down(id)
      case id
        when KeyBinding[:next_subject]
          self.next
          @window.timer.reset
          change_scale
        when KeyBinding[:prev_subject]
          self.previous
          @window.timer.reset
          change_scale
      end
    end

  end

end