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
      @key = KeyObserver.new(window, Gosu::KbPeriod)
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
      check_keys
      if @fading
        if @theme.volume > 0
          @theme.volume -= 0.005
        else
          @theme.stop
        end
      end
    end

    def check_keys
      @theme.playing? ? fade : start if @key.pressed?
    end

  end
end
