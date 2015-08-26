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
      @font = Gosu::Font.new(@window.x_size / 15)
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
      size = @font.text_width(current, scale_x = @scale)
      if size < (@window.x_size / 10) * 9
        # increase size
        @scale += 0.01
        change_scale
      elsif size > (@window.x_size / 20) * 19
        # shrink
        @scale -= 0.01
        change_scale
      end
    end

    def button_down(id)
      case id
        when KeyBinding[:next_subject]
          self.next
          change_scale
        when KeyBinding[:prev_subject]
          self.previous
          change_scale
      end
    end

  end

end