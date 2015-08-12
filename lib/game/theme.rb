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
      @key = Gosu::KbPeriod
    end

    def start
      if !@theme.playing?
        @theme.play
      end
    end

    def fade
      if @theme.playing?
        @fading = true
      end
    end

    def update
      check_keys
      if @fading
        if @theme.volume > 0
          puts @theme.volume
          @theme.volume -= 0.005
        else
          @theme.stop
        end
      end
    end

    def check_keys
      if @window.button_down?(@key)
        @theme.playing? ? fade : start unless @key_pushed
        @key_pushed = true
      else
        @key_pushed = false
      end
    end

  end
end