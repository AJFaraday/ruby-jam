module Game
  class Theme

    def initialize(window)
      @window = window
      @theme = Gosu::Song.new(
        File.join(
          File.dirname(__FILE__),
          '..', '..', 'audio',
          'theme.ogg'
        )
      )
    end

    def start
      unless @theme.playing?
        @theme.volume = 1
        @theme.play
        @fading = false
      end
    end

    def fade
      if @theme.playing?
        @fading = true
      end
    end

    def update
      if @fading
        if @theme.volume > 0
          @theme.volume -= 0.005
        else
          @theme.stop
        end
      end
    end

    def button_down(id)
      if id == KeyBinding[:music]
        @theme.playing? ? fade : start
      end
    end

  end
end
